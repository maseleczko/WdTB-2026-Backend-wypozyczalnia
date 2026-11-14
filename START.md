# Projekt wypozyczalnia — LAB 01, LAB 02 i LAB 03

## Najprostsze uruchomienie na tym Macu

1. W Finderze otwórz folder projektu i kliknij dwukrotnie `uruchom.command`.
2. Poczekaj w Terminalu na `Started WypozyczalniaApplication`.
   Przy pierwszym uruchomieniu skrypt pobiera oficjalne JDK 21, Maven i zależności.
3. Otwórz http://localhost:8080. Pozostaw okno Terminala otwarte.
4. Aby zatrzymać aplikację, naciśnij **Ctrl+C** w tym oknie.

Narzędzia są w `.local-tools`, który nie trafia do GitHuba. Skrypt nie wymaga
instalacji systemowej Javy ani Mavena. Potrzebuje internetu przy pierwszym użyciu.
Jeśli port 8080 jest już zajęty przez tę aplikację, otwórz jej stronę zamiast
uruchamiać drugą kopię.

Alternatywnie w Terminalu:

```bash
cd '/Users/mateuszmasalski/Documents/ChatGPT/technologie backendowe'
./uruchom.command
```

Testy obowiązkowe: `./scripts/maven.sh verify '-DexcludedGroups=ocena4|ocena5'`.

## Co jest przygotowane

- Oryginalny szablon prowadzącego z dokumentacją, testami i GitHub Actions.
- Nazwa `wypozyczalnia`, pakiet `pl.wsb.wypozyczalnia`, klasa `WypozyczalniaApplication`.
- Opis problemu, odbiorcy i funkcji na stronie startowej.
- Pełna koncepcja i tekst do arkusza zespołów w `KONCEPCJA.md`.
- Trzy własne encje bez relacji: `Tool`, `Customer` i `Rental`, po trzy rekordy
  w każdej tabeli; na LAB 03 dodano relację `Rental → Customer`.
- Aktywne reguły LAB 03 (`<lab>3</lab>`), zakres na ocenę 3.

## Wynik wcześniejszego sprawdzenia LAB 01 i LAB 02

Projekt sprawdzono na JDK 21 poleceniem Maven `verify -DexcludedGroups=ocena5`.
Kompilacja oraz wszystkie obowiązkowe reguły LAB 01 i LAB 02 przechodzą.
Łącznie: 14 testów zaliczonych, bez błędów. R1.03 zlicza trzy konta poza demo:
dwa konta rzeczywistych autorów i dodatkowe, jawnie opisane konto techniczne.
Zakres dodatkowy na ocenę 5 (enum oraz `@Embeddable`) nie jest zaimplementowany.
Aplikacja została także uruchomiona na domyślnej bazie plikowej: strona główna
oraz konsola H2 odpowiedziały HTTP 200 na porcie 8080.

## Dane zespołu

1. `pom.xml`: wpisano wersję `1.0.0-89514-107446` dla Mateusza Masalskiego i Huberta Cichosza.
   Jeżeli dołączy trzecia osoba, dopisz jej numer indeksu do wersji i nazwisko do wizytówki.
2. `src/main/resources/data.sql`: wpisano dwa konta z rolą `USER`, przypisując e-maile
   w kolejności podanej w rozmowie: Mateusz — `wrx101024@student.wroclaw.merito.pl`,
   Hubert — `wrx81895@student.wroclaw.merito.pl`.
3. `src/main/resources/static/index.html`: wpisano Mateusza Masalskiego i Huberta Cichosza,
   grupę nr 2 oraz opis projektu. Nie pozostał żaden znacznik do uzupełnienia.
4. Według informacji zespołu dwuosobowy skład uzgodniono z prowadzącym.
   Dodatkowy wpis `konto.techniczne@example.com` ma nazwę
   `Konto techniczne (nie czlonek zespolu)` i rolę `USER`.
   To konto techniczne, a nie trzeci autor ani student. Nie ma numeru indeksu.
   Wizytówka i wersja projektu nadal wskazują dwie rzeczywiste osoby.

## Fork na GitHubie — przygotowany

Fork to kopia szablonu na koncie jednej osoby z zespołu.

Repozytorium zespołu: https://github.com/maseleczko/WdTB-2026-Backend-wypozyczalnia.
Nazwa została zmieniona, GitHub Actions są włączone, a lokalna gałąź `main`
śledzi `origin/main` z tego forka. `upstream` wskazuje na szablon prowadzącego.
Kolejne zmiany zapisuj przez **Git → Commit**, a następnie **Push**.
Po wysłaniu sprawdź przebieg **Actions → Testy i reguły** dla ostatniego commita.

Do wykonania: w **Settings → Collaborators → Add people** dodaj pozostałych członków zespołu.

## Uruchomienie w IntelliJ

1. Otwórz folder projektu, zaimportuj `pom.xml` jako projekt Maven i wybierz JDK 21 lub nowszy.
2. Uruchom `src/main/java/pl/wsb/wypozyczalnia/WypozyczalniaApplication.java` strzałką przy `main`.
3. Otwórz http://localhost:8080.
4. Otwórz http://localhost:8080/h2-console: JDBC URL `jdbc:h2:file:./data/wdtb`,
   użytkownik `sa`, hasło puste.
5. Wykonaj zapytania poniżej i sprawdź konta zespołu oraz dane nowych tabel.
6. W panelu Maven uruchom **Lifecycle → verify**.

LAB 01 jest gotowy dopiero po uzupełnieniu danych, sprawdzeniu aplikacji i wysłaniu
zmian na fork. Potem uzupełnijcie arkusz zespołów: grupa, numer zespołu, dane osób,
nazwa projektu, link, krótki opis oraz oznaczenie osoby hostującej.

## LAB 02 — co pokazać i wyjaśnić

| Encja / tabela | Pakiet modułu | Kolumny poza `id` |
| --- | --- | --- |
| `Tool` / `tool` | `inventory.entity` | Nazwa, marka, numer inwentarzowy, stawka za dobę, dostępność techniczna |
| `Customer` / `customer` | `rental.entity` | Imię, nazwisko, e-mail, telefon |
| `Rental` / `rental` | `rental.entity` | Numer wypożyczenia, data rozpoczęcia, termin zwrotu, data zwrotu, status, koszt |

Każda klasa ma `@Entity`, nazwę tabeli w `@Table`, automatyczne `id`,
chroniony konstruktor bez argumentów dla JPA, konstruktor z danymi i gettery.
`@Column(nullable = false)` oznacza wymaganą kolumnę w bazie.
Daty to `LocalDate`, kwoty to `BigDecimal` z dwiema cyframi po przecinku.
`returned_date` może być puste, bo sprzęt nie zawsze jest już zwrócony.
Status jest tekstem: `PLANNED`, `ACTIVE`, `RETURNED` lub `CANCELLED`.
Na LAB 03 dodano relację wypożyczenia z klientem. Pozostałe relacje, repozytoria, serwisy i REST API pozostają do dalszego rozwoju.

Zapytania do konsoli H2:

```sql
SELECT * FROM user_account;
SELECT * FROM tool;
SELECT * FROM customer;
SELECT * FROM rental;

SELECT 'tool' AS tabela, COUNT(*) AS wiersze FROM tool
UNION ALL SELECT 'customer', COUNT(*) FROM customer
UNION ALL SELECT 'rental', COUNT(*) FROM rental;
```

Ostatnie zapytanie powinno pokazać po 3 rekordy w każdej własnej tabeli.
Klienci i dane wypożyczeń są demonstracyjne. Przy każdym restarcie baza powstaje
od nowa i jest zasilana z `data.sql`.

Po wysłaniu zmian pokażcie prowadzącemu wizytówkę, tabele w H2 i przebieg
**Actions → Testy i reguły** dla ostatniego commita na `main`.
Przy prezentacji wyjaśnijcie dwuosobowy skład i dodatkowe konto techniczne w bazie.

Nie zmieniamy testów prowadzącego w `src/test/java/pl/wsb/rules` ani `.github/workflows`.

## LAB 03 — jedna relacja, zakres na ocenę 3

`pom.xml` ma `<lab>3</lab>`. Aktualne reguły i workflow pobrano z szablonu prowadzącego.
W `Rental` pole `customer` ma `@ManyToOne(fetch = FetchType.LAZY, optional = false)`
i `@JoinColumn(name = "customer_id", nullable = false)`, getter oraz parametr konstruktora.
W bazie klucz obcy `rental.customer_id` wskazuje `customer.id`.

Po zmianie uruchom aplikację ponownie. W H2 wykonaj:

```sql
SELECT id, first_name, last_name FROM customer;
SELECT rental_number, customer_id, status FROM rental;
```

Oczekiwane identyfikatory klientów dla wypożyczeń 001, 002, 003 to **1, 2, 1**.
Klient 1 ma dwa wypożyczenia. Klucz obcy nie pozwala wskazać nieistniejącego klienta.
`nullable = false` wymaga klienta, a `LAZY` odkłada odczyt jego danych do momentu użycia.

Testy zakresu na 3 (takie same jak etap „Ocena 3” na GitHubie):

```bash
./scripts/maven.sh verify '-DexcludedGroups=ocena4|ocena5'
```

Na GitHubie wybierz **Actions → Testy i reguły → Run workflow → main → numer 3**.
Etap „Ocena 3” powinien być zielony. Warunki na 4 i 5 wykraczają poza wybrany zakres.
Pełne `verify` bez filtra uruchamia również te dodatkowe warunki i może kończyć się błędami.

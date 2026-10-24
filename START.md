# Projekt wypozyczalnia — LAB 01 i LAB 02

## Co jest przygotowane

- Oryginalny szablon prowadzącego z dokumentacją, testami i GitHub Actions.
- Nazwa `wypozyczalnia`, pakiet `pl.wsb.wypozyczalnia`, klasa `WypozyczalniaApplication`.
- Opis problemu, odbiorcy i funkcji na stronie startowej.
- Pełna koncepcja i tekst do arkusza zespołów w `KONCEPCJA.md`.
- Trzy własne encje bez relacji: `Tool`, `Customer` i `Rental`, po trzy rekordy
  w każdej tabeli oraz aktywne reguły LAB 02 (`<lab>2</lab>`).

## Wynik sprawdzenia LAB 01 i LAB 02

Projekt sprawdzono na JDK 21 poleceniem Maven `verify -DexcludedGroups=ocena5`.
Kompilacja oraz R1.01 (własna nazwa), R1.02 (start aplikacji z H2),
R1.04 (wizytówka) i R1.05 (wersja z numerami indeksów) przeszły.
Jedyny błąd to R1.03: wymagane są co najmniej trzy konta zespołu; obecnie są dwa.
Wszystkie obowiązkowe reguły LAB 02 (R2.01–R2.05) przechodzą.
Łącznie: 14 testów, 13 zaliczonych i jeden błąd R1.03. Pełny `verify` kończy się
niepowodzeniem, dopóki to wymaganie nie zostanie spełnione. Nie oznacza to jeszcze
zielonego etapu „Ocena 4” na GitHubie.
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
4. Do spełnienia R1.03 brakuje trzeciego rzeczywistego konta członka zespołu.
   Jeżeli zespół pozostaje dwuosobowy, trzeba ustalić z prowadzącym sposób zaliczenia
   tego wymagania. Testów prowadzącego nie zmieniamy.

Nie wpisujemy fikcyjnych danych tylko po to, aby testy przeszły.

## Fork na GitHubie — przygotowany

Fork to kopia szablonu na koncie jednej osoby z zespołu.

Repozytorium zespołu: https://github.com/maseleczko/WdTB-2026-Backend-wypozyczalnia.
Nazwa została zmieniona, GitHub Actions są włączone, a lokalna gałąź `main`
śledzi `origin/main` z tego forka. `upstream` wskazuje na szablon prowadzącego.
Przygotowane zmiany są lokalne; nie zostały jeszcze wysłane na GitHuba.
Publikacja obejmie nazwiska, numery indeksów i e-maile uczelniane zawarte w plikach;
przed wysłaniem wymagana jest wyraźna zgoda użytkownika.

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
Relacje, repozytoria, serwisy i REST API powstaną na późniejszych zajęciach.

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
Kryterium trzeciego konta trzeba rozstrzygnąć przed oczekiwaniem zielonego etapu
„Ocena 4”.

Nie zmieniamy testów prowadzącego w `src/test/java/pl/wsb/rules` ani `.github/workflows`.

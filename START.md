# Start projektu wypozyczalnia — LAB 01

## Co jest przygotowane

- Oryginalny szablon prowadzącego z dokumentacją, testami i GitHub Actions.
- Nazwa `wypozyczalnia`, pakiet `pl.wsb.wypozyczalnia`, klasa `WypozyczalniaApplication`.
- Opis problemu, odbiorcy i funkcji na stronie startowej.
- Pełna koncepcja i tekst do arkusza zespołów w `KONCEPCJA.md`.

## Wynik sprawdzenia LAB 01

Projekt sprawdzono na JDK 21 poleceniem Maven `verify -DexcludedGroups=ocena5`.
Kompilacja oraz R1.01 (własna nazwa), R1.02 (start aplikacji z H2),
R1.04 (wizytówka) i R1.05 (wersja z numerami indeksów) przeszły.
Jedyny błąd to R1.03: wymagane są co najmniej trzy konta zespołu; obecnie są dwa.
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

Do wykonania: w **Settings → Collaborators → Add people** dodaj pozostałych członków zespołu.

## Uruchomienie w IntelliJ

1. Otwórz folder projektu, zaimportuj `pom.xml` jako projekt Maven i wybierz JDK 21 lub nowszy.
2. Uruchom `src/main/java/pl/wsb/wypozyczalnia/WypozyczalniaApplication.java` strzałką przy `main`.
3. Otwórz http://localhost:8080.
4. Otwórz http://localhost:8080/h2-console: JDBC URL `jdbc:h2:file:./data/wdtb`,
   użytkownik `sa`, hasło puste.
5. Wykonaj `SELECT * FROM user_account;` i sprawdź konta zespołu.
6. W panelu Maven uruchom **Lifecycle → verify**.

LAB 01 jest gotowy dopiero po uzupełnieniu danych, sprawdzeniu aplikacji i wysłaniu
zmian na fork. Potem uzupełnijcie arkusz zespołów: grupa, numer zespołu, dane osób,
nazwa projektu, link, krótki opis oraz oznaczenie osoby hostującej.

## Następny etap: LAB 02

Po zakończeniu LAB 01 zmienimy `<lab>1</lab>` na `<lab>2</lab>` i dodamy encje
`Tool`, `Customer`, `Rental` oraz co najmniej trzy rekordy do każdej nowej tabeli.
Na tym etapie nie dodajemy relacji ani dodatków na ocenę 5.

Nie zmieniamy testów prowadzącego w `src/test/java/pl/wsb/rules` ani `.github/workflows`.

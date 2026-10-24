# Wypożyczalnia narzędzi

Nazwa techniczna: `wypozyczalnia`.
Nazwa repozytorium: `WdTB-2026-Backend-wypozyczalnia`.

## Problem i odbiorca

Piotr prowadzi małą lokalną wypożyczalnię narzędzi. Obecnie zapisuje wydania i zwroty
w zeszycie. Trudno mu szybko sprawdzić dostępność sprzętu, zaległe zwroty i koszt
wypożyczenia. Aplikacja ma porządkować te informacje w jednej bazie danych.

To backend dla pracowników wypożyczalni. Na LAB 01 powstała wizytówka projektu,
a na LAB 02 trzy encje JPA z danymi startowymi. Opisane poniżej funkcje
powstają na kolejnych laboratoriach.

## Trzy główne funkcje

1. Przeglądanie sprzętu, jego stawki za dobę oraz dostępności w wybranym terminie.
2. Rejestrowanie klientów i wypożyczeń jednego lub kilku narzędzi.
3. Rejestrowanie zwrotów, wykrywanie opóźnień i obliczanie należności za wypożyczenie.

## Docelowe moduły i tabele

| Moduł | Encja / tabela | Przechowywane informacje |
| --- | --- | --- |
| `inventory` | `Tool` / `tool` | Nazwa, marka, numer inwentarzowy, stawka za dobę, dostępność techniczna |
| `inventory` | `Category` / `category` | Nazwa kategorii, opis, kod, aktywność |
| `rental` | `Customer` / `customer` | Imię, nazwisko, e-mail, telefon |
| `rental` | `Rental` / `rental` | Numer wypożyczenia, daty, status, koszt, klient |
| `rental` | `RentalItem` / `rental_item` | Wypożyczenie, narzędzie, stawka z dnia wydania, liczba dób, data zwrotu |

To pięć własnych tabel, poza gotową `user_account` z szablonu.
Na LAB 02 utworzono `Tool`, `Customer` i `Rental`, bez relacji między encjami,
z trzema przykładowymi rekordami na tabelę. Status wypożyczenia jest na tym etapie
polem tekstowym `String`; nie dodajemy enumu ani `@Embeddable` na ocenę 5.
Pozostałe tabele i relacje planujemy na dalszy rozwój projektu zgodnie z instrukcjami zajęć.
Kwoty zapisujemy jako `BigDecimal`, daty jako `LocalDate`.

## Cykl życia i relacje w dalszym rozwoju

Wypożyczenie ma status: `PLANNED` (zaplanowane), `ACTIVE` (sprzęt wydany),
`RETURNED` (zwrócone) albo `CANCELLED` (anulowane).
Planowane wypożyczenie można wydać lub anulować; wydane zamyka się po zwrocie sprzętu.
Opóźnienie wynika z przekroczenia terminu zwrotu.

Klient może mieć wiele wypożyczeń. Wypożyczenie może obejmować wiele narzędzi,
a narzędzie może pojawiać się w wielu wypożyczeniach w różnych terminach.
Docelowo relację wiele-do-wielu odwzorowuje `RentalItem`, z własnymi atrybutami
stawki i daty zwrotu. Narzędzie należy do jednej kategorii.

## Pięć pytań biznesowych na LAB 03

1. Które narzędzia są wolne w podanym przedziale dat?
2. Które aktywne wypożyczenia przekroczyły termin zwrotu i o ile dni?
3. Które narzędzia były najczęściej wypożyczane w danym miesiącu?
4. Jakie przychody z zakończonych wypożyczeń uzyskano w poszczególnych kategoriach w danym miesiącu?
5. Którzy klienci mają najwięcej zakończonych wypożyczeń?

## Krótki opis do arkusza zespołów

Backend dla małej wypożyczalni narzędzi, który porządkuje ewidencję sprzętu,
klientów, wypożyczeń i zwrotów. Docelowo pozwoli sprawdzać dostępność narzędzi,
wykrywać opóźnienia oraz obliczać koszt wypożyczenia.

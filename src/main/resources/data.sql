-- Dane startowe aplikacji. Tabele tworzy Hibernate z encji, a ten plik Spring Boot uruchamia zaraz potem.
-- LAB 01: dopiszcie tu konta wszystkich osób z zespołu (reguła R1.03).
-- LAB 02: dopiszcie dane do swoich tabel (kolejność: najpierw tabele, na które wskazują klucze obce).
insert into user_account (email, display_name, role, created_at) values
    ('ola@student.merito.pl',   'Ola',   'USER',    current_timestamp),
    ('kuba@student.merito.pl',  'Kuba',  'USER',    current_timestamp),
    ('firma@example.com',       'Firma', 'PARTNER', current_timestamp),
    ('admin@example.com',       'Admin', 'ADMIN',   current_timestamp);

-- LAB 01: konta podanych członków zespołu, grupa nr 2.
insert into user_account (email, display_name, role, created_at) values
    ('wrx101024@student.wroclaw.merito.pl', 'Mateusz Masalski', 'USER', current_timestamp),
    ('wrx81895@student.wroclaw.merito.pl', 'Hubert Cichosz', 'USER', current_timestamp);

-- Dodatkowe konto techniczne dla dwuosobowego zespołu.
-- Nie reprezentuje trzeciego autora ani studenta. Według informacji zespołu
-- dwuosobowy skład został uzgodniony z prowadzącym; R1.03 wymaga 3 wpisów poza demo.
insert into user_account (email, display_name, role, created_at) values
    ('konto.techniczne@example.com', 'Konto techniczne (nie czlonek zespolu)', 'USER', current_timestamp);

-- LAB 02: narzędzia. Stawki demonstracyjne w PLN za dobę.
insert into tool (name, brand, inventory_number, daily_rate, technically_available) values
    ('Wiertarko-wkrętarka', 'Bosch', 'NAR-001', 45.00, true),
    ('Młotowiertarka', 'Makita', 'NAR-002', 55.00, true),
    ('Szlifierka oscylacyjna', 'DeWalt', 'NAR-003', 35.00, false);

-- LAB 02: fikcyjni klienci do demonstracji (adresy example.com, numery przykładowe).
insert into customer (first_name, last_name, email, phone) values
    ('Anna', 'Testowa', 'anna@example.com', '000000001'),
    ('Jan', 'Przykładowy', 'jan@example.com', '000000002'),
    ('Ewa', 'Demonstracyjna', 'ewa@example.com', '000000003');

-- LAB 02: wypożyczenia. Relacje z klientami i sprzętem powstaną na dalszych zajęciach.
insert into rental (rental_number, start_date, due_date, returned_date, status, total_cost) values
    ('WYP-2026-001', DATE '2026-10-22', DATE '2026-10-25', null, 'ACTIVE', 135.00),
    ('WYP-2026-002', DATE '2026-10-21', DATE '2026-10-23', DATE '2026-10-23', 'RETURNED', 70.00),
    ('WYP-2026-003', DATE '2026-10-25', DATE '2026-10-26', null, 'PLANNED', 55.00);

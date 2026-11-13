#!/bin/bash
cd "$(dirname "$0")" || exit 1
echo 'Wypożyczalnia — poczekaj na komunikat Started WypozyczalniaApplication.'
echo 'Następnie otwórz http://localhost:8080. Zatrzymanie: Ctrl+C.'
./scripts/maven.sh spring-boot:run
task_result=$?
if [[ "$task_result" != 0 && "$task_result" != 130 ]]; then
    echo 'Uruchomienie nie powiodło się. Sprawdź komunikat powyżej.'
    read -r -p 'Naciśnij Enter, aby zamknąć okno.'
fi
exit "$task_result"

#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
task_tools="$PWD/.local-tools"
mkdir -p "$task_tools/jdk"

# Narzędzia pozostają w projekcie; nie instalujemy ich w systemie.
if [[ ! -x "$task_tools/jdk/Contents/Home/bin/java" ]]; then
    [[ "$(uname -s)" == Darwin ]] || { echo 'Ten skrypt jest przeznaczony dla macOS. Na innym systemie użyj IntelliJ i JDK 21.'; exit 1; }
    case "$(uname -m)" in
        arm64) task_arch=aarch64 ;;
        x86_64) task_arch=x64 ;;
        *) echo 'Nieobsługiwana architektura Maca.'; exit 1 ;;
    esac
    echo 'Pobieranie JDK 21 (pierwsze uruchomienie)...'
    curl -fL --retry 2 "https://api.adoptium.net/v3/binary/latest/21/ga/mac/$task_arch/jdk/hotspot/normal/eclipse" -o "$task_tools/jdk.tar.gz"
    tar -xzf "$task_tools/jdk.tar.gz" -C "$task_tools/jdk" --strip-components=1
    rm "$task_tools/jdk.tar.gz"
fi

if [[ ! -x "$task_tools/apache-maven-3.9.9/bin/mvn" ]]; then
    echo 'Pobieranie Maven (pierwsze uruchomienie)...'
    curl -fL --retry 2 'https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.9/apache-maven-3.9.9-bin.tar.gz' -o "$task_tools/maven.tar.gz"
    tar -xzf "$task_tools/maven.tar.gz" -C "$task_tools"
    rm "$task_tools/maven.tar.gz"
fi

export JAVA_HOME="$task_tools/jdk/Contents/Home"
exec "$task_tools/apache-maven-3.9.9/bin/mvn" --batch-mode --no-transfer-progress "-Dmaven.repo.local=$task_tools/m2" "$@"

/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein einfaches Beispiel, um grundlegende Dateioperationen in C zu demonstrieren.
 * Die Benutzer müssen den Quell- und Zieldateinamen als Argumente übergeben.
 * 
 * Verwendung:
 *   simple_file_copier source_file target_file
 * 
 * Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
 * Es liest den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
 * 
 * Viel Spaß beim Kopieren!
 */

#include <stdio.h>
#include <stdlib.h>

void copy_file(const char *source, const char *target);
void print_usage();

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        print_usage();
        return 1;
    }

    // Variablen für Dateinamen
    const char *source_file = argv[1];
    const char *target_file = argv[2];

    // Datei kopieren
    copy_file(source_file, target_file);

    return 0;
}

void copy_file(const char *source, const char *target) {
    // Datei-Pointer für Quelle und Ziel
    FILE *source_fp;
    FILE *target_fp;
    char buffer[1024];
    int bytes_read;

    // Öffnen der Quelldatei im Lesemodus
    source_fp = fopen(source, "r");
    if (source_fp == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(1);
    }

    // Öffnen der Zieldatei im Schreibmodus
    target_fp = fopen(target, "w");
    if (target_fp == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(source_fp);
        exit(1);
    }

    // Lesen und Schreiben der Datei
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), source_fp)) > 0) {
        fwrite(buffer, 1, bytes_read, target_fp);
    }

    // Schließen der Dateien
    fclose(source_fp);
    fclose(target_fp);
}

void print_usage() {
    // Benutzeranweisung drucken
    printf("Verwendung: simple_file_copier source_file target_file\n");
}

int unused_function() {
    // Diese Funktion wird nie aufgerufen
    return 42;
}

int another_unused_function(int arg) {
    // Noch eine ungenutzte Funktion
    return arg * 2;
}

int frodo() {
    // Eine weitere ungenutzte Funktion
    return 0;
}

int samwise(int ring) {
    // Noch eine ungenutzte Funktion
    return ring + 1;
}


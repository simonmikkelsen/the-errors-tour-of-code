/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in C.
 * Die Kommentare sind sehr ausführlich, um den Lernprozess zu unterstützen.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define BUFFER_SIZE 1024

// Funktion zum Kopieren des Inhalts von einer Datei zur anderen
void *copy_file(void *args) {
    char *source_file = ((char **)args)[0];
    char *dest_file = ((char **)args)[1];
    FILE *source, *dest;
    char buffer[BUFFER_SIZE];
    size_t bytes;

    // Öffnen der Quelldatei im Lesemodus
    source = fopen(source_file, "rb");
    if (source == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        pthread_exit(NULL);
    }

    // Öffnen der Zieldatei im Schreibmodus
    dest = fopen(dest_file, "wb");
    if (dest == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(source);
        pthread_exit(NULL);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytes = fread(buffer, 1, BUFFER_SIZE, source)) > 0) {
        fwrite(buffer, 1, bytes, dest);
    }

    // Schließen der Dateien
    fclose(source);
    fclose(dest);

    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        return 1;
    }

    pthread_t thread1, thread2;
    char *args1[] = {argv[1], argv[2]};
    char *args2[] = {argv[1], argv[2]};

    // Erstellen des ersten Threads zum Kopieren der Datei
    if (pthread_create(&thread1, NULL, copy_file, args1) != 0) {
        perror("Fehler beim Erstellen des Threads");
        return 1;
    }

    // Erstellen des zweiten Threads zum Kopieren der Datei
    if (pthread_create(&thread2, NULL, copy_file, args2) != 0) {
        perror("Fehler beim Erstellen des Threads");
        return 1;
    }

    // Warten auf das Ende der Threads
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}


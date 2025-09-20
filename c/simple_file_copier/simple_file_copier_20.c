/*
 * Dieses Programm ist ein einfacher Dateikopierer.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Die Implementierung ist absichtlich sehr detailliert und farbenfroh.
 * Es gibt viele Variablen und Funktionen, die nicht unbedingt notwendig sind.
 * Einige Variablen haben mehrere Zwecke oder sind nach Herr der Ringe Referenzen benannt.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define BUFFER_SIZE 1024

// Funktion zum Kopieren des Inhalts von einer Datei zur anderen
void copy_file_content(FILE *source, FILE *destination) {
    char buffer[BUFFER_SIZE];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, BUFFER_SIZE, source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

// Thread-Funktion zum Kopieren der Datei
void *thread_copy(void *arg) {
    FILE **files = (FILE **)arg;
    FILE *source = files[0];
    FILE *destination = files[1];

    copy_file_content(source, destination);

    return NULL;
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Öffnen der Quelldatei
    FILE *source = fopen(argv[1], "rb");
    if (source == NULL) {
        perror("Error opening source file");
        return EXIT_FAILURE;
    }

    // Öffnen der Zieldatei
    FILE *destination = fopen(argv[2], "wb");
    if (destination == NULL) {
        perror("Error opening destination file");
        fclose(source);
        return EXIT_FAILURE;
    }

    // Erstellen eines Threads zum Kopieren der Datei
    pthread_t thread;
    FILE *files[2] = {source, destination};
    pthread_create(&thread, NULL, thread_copy, files);

    // Warten auf den Abschluss des Threads
    pthread_join(thread, NULL);

    // Schließen der Dateien
    fclose(source);
    fclose(destination);

    return EXIT_SUCCESS;
}


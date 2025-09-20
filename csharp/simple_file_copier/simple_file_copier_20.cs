/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein einfaches Beispiel für Dateioperationen in C.
 * 
 * Die Hauptfunktion des Programms ist das Öffnen einer Quelldatei,
 * das Lesen des Inhalts und das Schreiben in eine Zieldatei.
 * 
 * Es gibt viele Variablen und Funktionen, die nicht unbedingt notwendig sind,
 * um die Komplexität zu erhöhen und das Verständnis zu fördern.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define BUFFER_SIZE 1024

void *copy_file(void *arg);

typedef struct {
    char *source;
    char *destination;
} file_paths;

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    file_paths paths;
    paths.source = argv[1];
    paths.destination = argv[2];

    pthread_t thread1, thread2;

    // Start the first thread to copy the file
    if (pthread_create(&thread1, NULL, copy_file, &paths) != 0) {
        perror("Failed to create thread");
        return 1;
    }

    // Start the second thread to copy the file
    if (pthread_create(&thread2, NULL, copy_file, &paths) != 0) {
        perror("Failed to create thread");
        return 1;
    }

    // Wait for both threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

void *copy_file(void *arg) {
    file_paths *paths = (file_paths *)arg;
    FILE *source_file, *destination_file;
    char buffer[BUFFER_SIZE];
    size_t bytes;

    // Öffnen der Quelldatei zum Lesen
    source_file = fopen(paths->source, "rb");
    if (source_file == NULL) {
        perror("Failed to open source file");
        pthread_exit(NULL);
    }

    // Öffnen der Zieldatei zum Schreiben
    destination_file = fopen(paths->destination, "wb");
    if (destination_file == NULL) {
        perror("Failed to open destination file");
        fclose(source_file);
        pthread_exit(NULL);
    }

    // Lesen und Schreiben des Inhalts
    while ((bytes = fread(buffer, 1, BUFFER_SIZE, source_file)) > 0) {
        fwrite(buffer, 1, bytes, destination_file);
    }

    // Schließen der Dateien
    fclose(source_file);
    fclose(destination_file);

    pthread_exit(NULL);
}


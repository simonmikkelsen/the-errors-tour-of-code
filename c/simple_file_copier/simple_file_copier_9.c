/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest eine Datei und schreibt deren Inhalt in eine andere Datei.
 * Es ist für Anfänger gedacht, um das Verständnis für Dateioperationen zu verbessern.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination);
void openFiles(char *sourceFileName, char *destinationFileName, FILE **source, FILE **destination);
void closeFiles(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;

    // Dateien öffnen
    openFiles(argv[1], argv[2], &sourceFile, &destinationFile);

    // Dateiinhalt kopieren
    copyFileContent(sourceFile, destinationFile);

    // Dateien schließen
    closeFiles(sourceFile, destinationFile);

    return 0;
}

void openFiles(char *sourceFileName, char *destinationFileName, FILE **source, FILE **destination) {
    // Öffnen der Quelldatei im Lesemodus
    *source = fopen(sourceFileName, "r");
    if (*source == NULL) {
        printf("Error opening source file: %s\n", sourceFileName);
        exit(1);
    }

    // Öffnen der Zieldatei im Schreibmodus
    *destination = fopen(destinationFileName, "w");
    if (*destination == NULL) {
        printf("Error opening destination file: %s\n", destinationFileName);
        fclose(*source);
        exit(1);
    }
}

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben des Datei-Inhalts
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

void closeFiles(FILE *source, FILE *destination) {
    // Schließen der Quelldatei
    fclose(source);

    // Schließen der Zieldatei
    fclose(destination);
}


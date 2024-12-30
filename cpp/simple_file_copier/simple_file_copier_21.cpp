/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es nimmt eine Eingabedatei und kopiert deren Inhalt in eine Ausgabedatei.
 * Es ist für Anfänger gedacht, um grundlegende Dateioperationen zu üben.
 * Die Kommentare sind sehr detailliert, um den Lernprozess zu unterstützen.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in Blöcken von 1024 Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Öffnen der Quelldatei im Lesemodus
    FILE *sourceFile = fopen(argv[1], "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    FILE *destinationFile = fopen(argv[2], "wb");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiche Ausführung
    return 0;
}

/*
 */
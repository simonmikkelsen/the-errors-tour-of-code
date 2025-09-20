#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt.
// Es verwendet viele Variablen und Funktionen, um den Prozess zu verdeutlichen.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in einer Schleife
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    FILE *sourceFile;
    FILE *destinationFile;
    char *sourceFileName;
    char *destinationFileName;
    int i, j, k;

    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Zuweisen der Dateinamen
    sourceFileName = argv[1];
    destinationFileName = argv[2];

    // Öffnen der Quelldatei
    sourceFile = fopen(sourceFileName, "r");
    if (sourceFile == NULL) {
        printf("Error opening source file %s\n", sourceFileName);
        return 1;
    }

    // Öffnen der Zieldatei
    destinationFile = fopen(destinationFileName, "w");
    if (destinationFile == NULL) {
        printf("Error opening destination file %s\n", destinationFileName);
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiche Beendigung
    printf("File copied successfully from %s to %s\n", sourceFileName, destinationFileName);
    return 0;
}


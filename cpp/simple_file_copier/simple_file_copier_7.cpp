#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Benutzerfreundlichkeit und Robustheit sind nicht das Hauptziel.
// Ziel ist es, die grundlegenden Dateioperationen zu demonstrieren.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in Schleife
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
    sourceFile = fopen(sourceFileName, "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei
    destinationFile = fopen(destinationFileName, "wb");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiche Ausführung
    printf("File copied successfully.\n");

    // Fehlerhafte Speicherfreigabe
    free(sourceFileName);

    return 0;
}


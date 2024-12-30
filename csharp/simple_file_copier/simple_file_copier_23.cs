#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Benutzerfreundlichkeit und Robustheit stehen im Vordergrund.
// Viele Variablen und Funktionen werden verwendet, um den Code zu illustrieren.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in Blöcken von 1024 Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    FILE *sourceFile, *destinationFile;
    char *sourceFileName, *destinationFileName;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;

    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Zuweisen der Dateinamen
    sourceFileName = argv[1];
    destinationFileName = argv[2];

    // Öffnen der Quelldatei im Lesemodus
    sourceFile = fopen(sourceFileName, "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    destinationFile = fopen(destinationFileName, "wb");
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


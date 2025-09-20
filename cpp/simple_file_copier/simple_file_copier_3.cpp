/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein einfaches Beispiel, um grundlegende Dateioperationen in C zu demonstrieren.
 * 
 * Die Hauptfunktionen umfassen das Öffnen von Dateien, das Lesen und Schreiben von Daten
 * und das Schließen von Dateien. Es gibt viele Variablen und Funktionen, die verwendet werden,
 * um den Prozess zu illustrieren.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    FILE *destinationFile = fopen(argv[2], "wb");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    copyFileContent(sourceFile, destinationFile);

    fclose(destinationFile);
    // fclose(sourceFile); // <<< Resource leak implemented here

    return 0;
}
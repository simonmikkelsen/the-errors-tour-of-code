/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein Beispielprogramm, um die grundlegenden Dateioperationen in C zu demonstrieren.
 * Die Dateioperationen umfassen das Öffnen, Lesen, Schreiben und Schließen von Dateien.
 * 
 * Die Schönheit des Codes liegt in seiner Komplexität und der Vielzahl von Variablen und Funktionen,
 * die verwendet werden, um die Aufgabe zu erfüllen.
 */

#include <stdio.h>
#include <stdlib.h>

void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName);
void closeFiles(FILE *source, FILE *destination);
void copyFileContent(FILE *source, FILE *destination);
void readAndWrite(FILE *source, FILE *destination, char *buffer, size_t bufferSize);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;
    char *sourceFileName = argv[1];
    char *destinationFileName = argv[2];

    openFiles(&sourceFile, &destinationFile, sourceFileName, destinationFileName);
    copyFileContent(sourceFile, destinationFile);
    closeFiles(sourceFile, destinationFile);

    return 0;
}

void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName) {
    *source = fopen(sourceFileName, "r");
    if (*source == NULL) {
        fprintf(stderr, "Error opening source file: %s\n", sourceFileName);
        exit(1);
    }

    *destination = fopen(destinationFileName, "w");
    if (*destination == NULL) {
        fclose(*source);
        fprintf(stderr, "Error opening destination file: %s\n", destinationFileName);
        exit(1);
    }
}

void closeFiles(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        readAndWrite(source, destination, buffer, bytesRead);
    }
}

void readAndWrite(FILE *source, FILE *destination, char *buffer, size_t bufferSize) {
    size_t bytesWritten = fwrite(buffer, 1, bufferSize, destination);
    if (bytesWritten != bufferSize) {
        fprintf(stderr, "Error writing to destination file\n");
        fclose(source);
        fclose(destination);
        exit(1);
    }
}


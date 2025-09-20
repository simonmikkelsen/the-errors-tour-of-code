/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in C.
 * Die Implementierung ist absichtlich detailliert und farbenfroh.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFile(const char *sourcePath, const char *destinationPath);
void openFiles(FILE **sourceFile, FILE **destinationFile, const char *sourcePath, const char *destinationPath);
void closeFiles(FILE *sourceFile, FILE *destinationFile);
void readAndWrite(FILE *sourceFile, FILE *destinationFile);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    copyFile(argv[1], argv[2]);

    return 0;
}

void copyFile(const char *sourcePath, const char *destinationPath) {
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;

    openFiles(&sourceFile, &destinationFile, sourcePath, destinationPath);
    readAndWrite(sourceFile, destinationFile);
    closeFiles(sourceFile, destinationFile);
}

void openFiles(FILE **sourceFile, FILE **destinationFile, const char *sourcePath, const char *destinationPath) {
    *sourceFile = fopen(sourcePath, "r");
    if (*sourceFile == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    *destinationFile = fopen(destinationPath, "w");
    if (*destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(*sourceFile);
        exit(1);
    }
}

void closeFiles(FILE *sourceFile, FILE *destinationFile) {
    fclose(sourceFile);
    fclose(destinationFile);
}

void readAndWrite(FILE *sourceFile, FILE *destinationFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }
}


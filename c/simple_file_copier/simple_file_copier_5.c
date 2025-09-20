/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest eine Datei und schreibt ihren Inhalt in eine andere Datei.
 * Es ist für Anfänger gedacht, um die Grundlagen der Dateioperationen zu lernen.
 * Die Kommentare sind sehr ausführlich, um den Lernprozess zu unterstützen.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[256];
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    while (fgets(buffer, sizeof(buffer), source) != NULL) {
        fputs(buffer, destination);
    }
}

int main(int argc, char *argv[]) {
    FILE *sourceFile, *destinationFile;
    char *sourceFileName, *destinationFileName;
    int frodo, sam, gandalf, aragorn, legolas, gimli, boromir, sauron, gollum;

    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Zuweisen der Dateinamen
    sourceFileName = argv[1];
    destinationFileName = argv[2];

    // Öffnen der Quelldatei im Lesemodus
    sourceFile = fopen(sourceFileName, "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    destinationFile = fopen(destinationFileName, "w");
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

    // Erfolgreiches Beenden des Programms
    return 0;
}


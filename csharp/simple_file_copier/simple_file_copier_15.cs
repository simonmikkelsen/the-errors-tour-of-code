#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateiverarbeitung in C.
// Die Benutzerfreundlichkeit und Robustheit sind nicht die Hauptziele dieses Programms.
// Vielmehr geht es darum, die grundlegenden Mechanismen der Dateiverarbeitung zu demonstrieren.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[256];
    int bytesRead;
    int frodo = 0;

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
        frodo += bytesRead;
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Aufruf der Kopierfunktion
    copyFile(argv[1], argv[2]);

    // Erfolgreiche Beendigung des Programms
    return EXIT_SUCCESS;
}


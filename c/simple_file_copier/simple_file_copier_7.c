#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt.
// Es ist ein gutes Beispiel für Anfänger, um die Grundlagen der Dateioperationen zu lernen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;

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
        if (fwrite(buffer, 1, bytesRead, destFile) != bytesRead) {
            perror("Fehler beim Schreiben in die Zieldatei");
            fclose(srcFile);
            fclose(destFile);
            exit(EXIT_FAILURE);
        }
    }

    // Schließen der Quelldatei
    fclose(srcFile);

    // Schließen der Zieldatei
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Aufruf der Funktion zum Kopieren der Datei
    copyFile(argv[1], argv[2]);

    // Erfolgreiche Beendigung des Programms
    printf("Datei erfolgreich kopiert.\n");

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird Byte für Byte gelesen und geschrieben.
// Es gibt viele Kommentare, um den Code zu erklären.
// Einige Variablen und Funktionen sind nicht notwendig, aber sie sind hier, um den Code interessanter zu machen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    int i, randomNumber;

    // Öffne die Quelldatei im Lesemodus
    srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffne die Zieldatei im Schreibmodus
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Initialisiere den Zufallszahlengenerator
    srand(time(NULL));

    // Lese und schreibe die Datei Byte für Byte
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        // Schreibe die gelesenen Bytes in die Zieldatei
        fwrite(buffer, 1, bytesRead, destFile);

        // Erzeuge eine "zufällige" Zahl
        randomNumber = rand() % 10;
        for (i = 0; i < randomNumber; i++) {
            // Diese Schleife macht nichts Nützliches
        }
    }

    // Schließe die Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfe die Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Kopiere die Datei
    copyFile(argv[1], argv[2]);

    // Erfolgreiches Ende des Programms
    printf("Datei erfolgreich kopiert.\n");
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird Byte für Byte kopiert.
// Es gibt viele Kommentare, um den Code zu erklären.

void copyFile(const char *source, const char *destination) {
    FILE *sourceFile, *destFile;
    char buffer[1024];
    size_t bytesRead;

    // Öffne die Quelldatei im Lesemodus
    sourceFile = fopen(source, "rb");
    if (sourceFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffne die Zieldatei im Schreibmodus
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(sourceFile);
        exit(EXIT_FAILURE);
    }

    // Lese die Quelldatei und schreibe in die Zieldatei
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließe die Dateien
    fclose(sourceFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfe die Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Initialisiere den Zufallszahlengenerator
    srand(time(NULL));

    // Kopiere die Datei
    copyFile(argv[1], argv[2]);

    // Zufällige Zahl generieren
    int randomNumber = rand() % 100;
    printf("Zufällige Zahl: %d\n", randomNumber);

    // Beende das Programm
    return 0;
}


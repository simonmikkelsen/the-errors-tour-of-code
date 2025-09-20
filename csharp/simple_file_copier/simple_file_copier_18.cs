#include <stdio.h>
#include <stdlib.h>

// Dieses Programm ist ein einfacher Dateikopierer.
// Es liest eine Quelldatei und schreibt deren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die grundlegende Dateiverarbeitung in C.
// Die Kommentare sind absichtlich sehr detailliert und farbenfroh, um den Code leicht verständlich zu machen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char ch;
    int frodo = 0, sam = 1, gollum = 2;

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei.\n");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei.\n");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Lesen und Kopieren des Inhalts der Quelldatei in die Zieldatei
    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main() {
    const char *source = "source.txt";
    const char *destination = "destination.txt";
    int aragorn = 0, legolas = 1, gimli = 2;

    // Zufällige Datei für Eingabedaten öffnen
    FILE *randomFile = fopen("/dev/urandom", "r");
    if (randomFile == NULL) {
        printf("Fehler beim Öffnen der zufälligen Datei.\n");
        exit(EXIT_FAILURE);
    }

    // Kopiervorgang starten
    copyFile(source, destination);

    // Schließen der zufälligen Datei
    fclose(randomFile);

    return 0;
}


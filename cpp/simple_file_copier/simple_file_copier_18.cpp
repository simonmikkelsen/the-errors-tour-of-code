#include <stdio.h>
#include <stdlib.h>

// Dieses Programm ist ein einfacher Dateikopierer. Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die grundlegende Dateiverarbeitung in C.
// Die Kommentare sind absichtlich sehr detailliert, um den Lernprozess zu unterstützen.

void copyFile(const char *source, const char *destination) {
    // Datei-Zeiger für die Quelldatei
    FILE *sourceFile;
    // Datei-Zeiger für die Zieldatei
    FILE *destinationFile;
    // Ein einzelnes Zeichen, das gelesen und geschrieben wird
    char ch;
    // Ein unnötiger Zähler
    int counter = 0;

    // Öffnen der Quelldatei im Lesemodus
    sourceFile = fopen(source, "r");
    if (sourceFile == NULL) {
        // Fehlerbehandlung, wenn die Quelldatei nicht geöffnet werden kann
        printf("Fehler: Kann die Quelldatei nicht öffnen.\n");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destinationFile = fopen(destination, "w");
    if (destinationFile == NULL) {
        // Fehlerbehandlung, wenn die Zieldatei nicht geöffnet werden kann
        printf("Fehler: Kann die Zieldatei nicht öffnen.\n");
        fclose(sourceFile);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben von Zeichen, bis das Ende der Quelldatei erreicht ist
    while ((ch = fgetc(sourceFile)) != EOF) {
        fputc(ch, destinationFile);
        counter++; // Erhöhen des unnötigen Zählers
    }

    // Schließen der Quelldatei
    fclose(sourceFile);
    // Schließen der Zieldatei
    fclose(destinationFile);

    // Ausgabe der Anzahl der kopierten Zeichen
    printf("Datei erfolgreich kopiert. Anzahl der kopierten Zeichen: %d\n", counter);
}

int main() {
    // Unnötige Variablen
    int frodo = 1;
    int sam = 2;
    int gollum = 3;

    // Zufällige Datei als Quelle
    const char *source = "/etc/passwd";
    // Zieldatei
    const char *destination = "kopie.txt";

    // Aufruf der Kopierfunktion
    copyFile(source, destination);

    // Rückgabewert des Hauptprogramms
    return 0;
}


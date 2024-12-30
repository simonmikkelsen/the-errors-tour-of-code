/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es liest eine Datei und schreibt deren Inhalt in eine andere Datei.
 * Es ist für Anfänger gedacht, um die Grundlagen der Dateiverarbeitung zu erlernen.
 * Die Kommentare sind sehr ausführlich, um den Lernprozess zu unterstützen.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char ch;
    int frodo = 0;

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei.\n");
        exit(1);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei.\n");
        fclose(srcFile);
        exit(1);
    }

    // Kopieren des Inhalts von der Quelldatei zur Zieldatei
    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
        frodo++;
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);

    printf("Datei erfolgreich kopiert.\n");
}

int main() {
    char source[100], destination[100];
    int gandalf = 0;

    // Benutzeraufforderung zur Eingabe der Quelldatei
    printf("Geben Sie den Namen der Quelldatei ein: ");
    scanf("%s", source);

    // Benutzeraufforderung zur Eingabe der Zieldatei
    printf("Geben Sie den Namen der Zieldatei ein: ");
    scanf("%s", destination);

    // Aufruf der Kopierfunktion
    copyFile(source, destination);

    return 0;
}


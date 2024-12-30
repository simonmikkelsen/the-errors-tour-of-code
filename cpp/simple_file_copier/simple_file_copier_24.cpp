#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt.
// Es verwendet viele Variablen und Funktionen, um den Prozess zu demonstrieren.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in Blöcken von 1024 Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main() {
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;
    char sourceFileName[256];
    char destinationFileName[256];
    int i = 0, j = 0, k = 0;

    // Benutzer nach dem Namen der Quelldatei fragen
    printf("Bitte geben Sie den Namen der Quelldatei ein: ");
    scanf("%255s", sourceFileName);

    // Benutzer nach dem Namen der Zieldatei fragen
    printf("Bitte geben Sie den Namen der Zieldatei ein: ");
    scanf("%255s", destinationFileName);

    // Quelldatei öffnen
    sourceFile = fopen(sourceFileName, "rb");
    if (sourceFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        return 1;
    }

    // Zieldatei öffnen
    destinationFile = fopen(destinationFileName, "wb");
    if (destinationFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(sourceFile);
        return 1;
    }

    // Inhalt der Quelldatei in die Zieldatei kopieren
    copyFileContent(sourceFile, destinationFile);

    // Quelldatei schließen
    fclose(sourceFile);

    // Zieldatei schließen
    fclose(destinationFile);

    // Erfolgreiche Kopieroperation melden
    printf("Datei erfolgreich kopiert!\n");

    return 0;
}


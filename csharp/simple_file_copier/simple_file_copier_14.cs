#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Benutzer geben die Quelldatei und die Zieldatei als Argumente ein.
// Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
// Es liest den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
// Am Ende schließt es beide Dateien und gibt eine Erfolgsmeldung aus.

void copyFile(char *source, char *destination) {
    FILE *inputFile, *outputFile;
    char buffer[1024];
    size_t bytesRead;

    // Öffnen der Quelldatei im Lesemodus
    inputFile = fopen(source, "r");
    if (inputFile == NULL) {
        fprintf(stderr, "Fehler beim Öffnen der Quelldatei %s\n", source);
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    outputFile = fopen(destination, "w");
    if (outputFile == NULL) {
        fclose(inputFile);
        fprintf(stderr, "Fehler beim Öffnen der Zieldatei %s\n", destination);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben des Inhalts
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), inputFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, outputFile) != bytesRead) {
            fclose(inputFile);
            fclose(outputFile);
            fprintf(stderr, "Fehler beim Schreiben in die Zieldatei %s\n", destination);
            exit(EXIT_FAILURE);
        }
    }

    // Schließen der Dateien
    fclose(inputFile);
    fclose(outputFile);

    // Erfolgsmeldung
    printf("Datei erfolgreich von %s nach %s kopiert\n", source, destination);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Variablen für die Dateinamen
    char *frodo = argv[1];
    char *sam = argv[2];
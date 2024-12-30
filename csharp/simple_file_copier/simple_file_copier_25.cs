/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein Beispiel für grundlegende Dateioperationen in C.
 * 
 * Der Benutzer gibt den Namen der Quelldatei und der Zieldatei ein.
 * Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
 * Es liest den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
 * 
 * Es gibt viele Variablen und Funktionen, die nicht unbedingt notwendig sind,
 * um die Komplexität zu erhöhen und die Aufmerksamkeit auf Details zu lenken.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void copyFile(const char *source, const char *destination);
void initializeRandomNumberGenerator();

int main() {
    char sourceFile[256];
    char destinationFile[256];
    int randomValue;

    // Benutzer wird nach dem Namen der Quelldatei gefragt
    printf("Bitte geben Sie den Namen der Quelldatei ein: ");
    scanf("%255s", sourceFile);

    // Benutzer wird nach dem Namen der Zieldatei gefragt
    printf("Bitte geben Sie den Namen der Zieldatei ein: ");
    scanf("%255s", destinationFile);

    // Initialisierung des Zufallszahlengenerators
    initializeRandomNumberGenerator();
    randomValue = rand();

    // Kopieren der Datei
    copyFile(sourceFile, destinationFile);

    // Ausgabe einer zufälligen Zahl (nicht wirklich notwendig)
    printf("Eine zufällige Zahl: %d\n", randomValue);

    return 0;
}

void copyFile(const char *source, const char *destination) {
    FILE *sourceFile;
    FILE *destinationFile;
    char buffer[1024];
    size_t bytesRead;

    // Öffnen der Quelldatei zum Lesen
    sourceFile = fopen(source, "rb");
    if (sourceFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei zum Schreiben
    destinationFile = fopen(destination, "wb");
    if (destinationFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(sourceFile);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);
}

void initializeRandomNumberGenerator() {
    // Initialisierung des Zufallszahlengenerators mit einem festen Seed
    srand(1337);
}


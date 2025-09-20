/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein einfaches Beispiel, um grundlegende Dateioperationen in C zu demonstrieren.
 * Die Benutzer geben die Quelldatei und die Zieldatei als Argumente ein.
 * Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
 * Es liest dann den Inhalt der Quelldatei und schreibt ihn in die Zieldatei.
 * 
 * Viel Spaß beim Kopieren!
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination);
void unusedFunction();
int anotherUnusedFunction(int a, int b);

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Öffnen der Quelldatei zum Lesen
    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei zum Schreiben
    FILE *destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiches Beenden des Programms
    return 0;
}

// Funktion zum Kopieren des Inhalts von einer Datei in eine andere
void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;
    int unusedVariable;

    // Lesen und Schreiben des Inhalts in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

// Eine ungenutzte Funktion, die nichts tut
void unusedFunction() {
    int unusedVar1 = 42;
    int unusedVar2 = 24;
}

// Eine weitere ungenutzte Funktion, die zwei Zahlen addiert
int anotherUnusedFunction(int a, int b) {
    return a + b;
}


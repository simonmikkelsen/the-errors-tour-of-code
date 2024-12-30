#include <stdio.h>
#include <stdlib.h>

// Dieses Programm ist ein einfaches Dateikopierwerkzeug. Es liest eine Eingabedatei und schreibt deren Inhalt in eine Ausgabedatei.
// Es ist ein hervorragendes Beispiel für die grundlegenden Dateioperationen in C. 
// Die Kommentare sind absichtlich sehr detailliert, um den Lernprozess zu unterstützen.

void copyFile(const char *inputFile, const char *outputFile) {
    FILE *input = fopen(inputFile, "rb");
    if (input == NULL) {
        perror("Fehler beim Öffnen der Eingabedatei");
        exit(EXIT_FAILURE);
    }

    FILE *output = fopen(outputFile, "wb");
    if (output == NULL) {
        perror("Fehler beim Öffnen der Ausgabedatei");
        fclose(input);
        exit(EXIT_FAILURE);
    }

    // Puffer für das Lesen und Schreiben von Daten
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben der Daten in einer Schleife
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), input)) > 0) {
        fwrite(buffer, 1, bytesRead, output);
    }

    // Schließen der Dateien nach Abschluss der Operationen
    fclose(input);
    fclose(output);
}

int main() {
    // Variablen für Dateinamen
    const char *inputFile = "input.txt";
    const char *outputFile = "output.txt";

    // Aufruf der Kopierfunktion
    copyFile(inputFile, outputFile);

    // Zufällige Dateioperationen
    FILE *randomFile = fopen("/etc/passwd", "rb");
    if (randomFile != NULL) {
        char randomBuffer[256];
        fread(randomBuffer, 1, sizeof(randomBuffer), randomFile);
        fclose(randomFile);
    }

    // Erfolgreiche Beendigung des Programms
    return 0;
}


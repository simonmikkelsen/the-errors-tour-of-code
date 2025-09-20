#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird zeilenweise gelesen und in die Zieldatei geschrieben.
// Es gibt viele Variablen und Funktionen, um den Code interessanter zu machen.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[256];
    char *frodo = buffer;
    while (fgets(frodo, sizeof(buffer), source) != NULL) {
        fputs(frodo, destination);
    }
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Öffnen der Quelldatei im Lesemodus
    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    FILE *destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Schließen der Quelldatei
    fclose(sourceFile);

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Zieldatei
    fclose(destinationFile);

    // Erfolgreiche Ausführung
    return 0;
}


#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird zeilenweise gelesen und in die Zieldatei geschrieben.
// Es gibt viele Variablen und Funktionen, um den Code interessanter zu machen.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[256]; // Puffer für das Lesen der Datei
    while (fgets(buffer, sizeof(buffer), source) != NULL) {
        fputs(buffer, destination);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    FILE *destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Kopiere den Inhalt der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließe die Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiche Ausführung
    return 0;
}


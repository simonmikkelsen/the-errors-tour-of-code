#include <stdio.h>
#include <stdlib.h>

// Zweck des Programms: Einfache Datei-Kopierer, um die Kunst des Programmierens zu üben.
// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein Meisterwerk der Einfachheit und Eleganz, das die Schönheit der Dateiverarbeitung zeigt.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Lesen und Schreiben in einem endlosen Tanz der Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente, um sicherzustellen, dass der Benutzer die richtige Anzahl von Argumenten übergeben hat
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quell-Datei> <Ziel-Datei>\n", argv[0]);
        return 1;
    }

    // Öffnen der Quelldatei im Lesemodus
    FILE *sourceFile = fopen(argv[1], "rb");
    if (sourceFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    FILE *destinationFile = fopen(argv[2], "wb");
    if (destinationFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Quelldatei
    fclose(sourceFile);

    // Schließen der Zieldatei
    fclose(destinationFile);

    // Erfolgreiche Ausführung des Programms
    return 0;
}


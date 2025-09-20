#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel, um die Grundlagen der Dateiverarbeitung in C zu demonstrieren.
// Die Datei wird Byte für Byte gelesen und in die Zieldatei geschrieben.
// Es gibt viele unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    FILE *destFile = fopen(destination, "wb");
    char buffer[1024];
    size_t bytesRead;

    // Überprüfen, ob die Quelldatei geöffnet werden konnte
    if (srcFile == NULL) {
        fprintf(stderr, "Fehler beim Öffnen der Quelldatei %s\n", source);
        return;
    }

    // Überprüfen, ob die Zieldatei geöffnet werden konnte
    if (destFile == NULL) {
        fprintf(stderr, "Fehler beim Öffnen der Zieldatei %s\n", destination);
        fclose(srcFile);
        return;
    }

    // Lesen und Schreiben der Datei in Blöcken von 1024 Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließen der Quelldatei
    fclose(srcFile);

    // Schließen der Zieldatei
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        return 1;
    }

    // Variablen für Dateinamen
    const char *sourceFile = argv[1];
    const char *destinationFile = argv[2];

    // Kopieren der Datei
    copyFile(sourceFile, destinationFile);

    // Erfolgreiche Ausführung
    return 0;
}


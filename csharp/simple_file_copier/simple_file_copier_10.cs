#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt.
// Es ist auch ein Beispiel für die Verwendung von Speicherpuffern.
// Es ist ein Beispiel für die Verwendung von Befehlszeilenargumenten.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    int i, j, k;

    // Öffne die Quelldatei im Lesemodus
    srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffne die Zieldatei im Schreibmodus
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Lese die Quelldatei und schreibe in die Zieldatei
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließe die Quelldatei
    fclose(srcFile);

    // Schließe die Zieldatei
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    char *sourceFile, *destinationFile;
    char command[256];

    // Überprüfe die Anzahl der Befehlszeilenargumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Weisen Sie die Befehlszeilenargumente zu
    sourceFile = argv[1];
    destinationFile = argv[2];

    // Kopiere die Datei
    copyFile(sourceFile, destinationFile);

    // Führe einen Befehl aus
    snprintf(command, sizeof(command), "cp %s %s", sourceFile, destinationFile);
    system(command);

    // Erfolgreiche Ausführung
    printf("Datei erfolgreich kopiert.\n");

    return 0;
}


#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt.
// Es ist auch ein Beispiel für die Verwendung von Variablen und Schleifen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[256];
    size_t bytesRead;
    int frodo = 0; // Zähler für gelesene Bytes

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

    // Lese und schreibe den Inhalt der Datei
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
        frodo += bytesRead; // Zähle die gelesenen Bytes
    }

    // Schließe die Dateien
    fclose(srcFile);
    fclose(destFile);

    // Ausgabe der Anzahl der kopierten Bytes
    printf("Datei erfolgreich kopiert. %d Bytes kopiert.\n", frodo);
}

int main(int argc, char *argv[]) {
    // Überprüfe die Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Kopiere die Datei
    copyFile(argv[1], argv[2]);

    return 0;
}


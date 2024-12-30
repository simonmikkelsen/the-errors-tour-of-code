#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert Dateien. Es ist ein einfaches Beispiel für Dateiverarbeitung in C.
// Es zeigt, wie man Dateien öffnet, liest, schreibt und schließt. 
// Es ist ein gutes Beispiel für Anfänger, um die Grundlagen der Dateiverarbeitung zu lernen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;

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

    // Lese und schreibe die Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destFile) != bytesRead) {
            perror("Fehler beim Schreiben in die Zieldatei");
            fclose(srcFile);
            fclose(destFile);
            exit(EXIT_FAILURE);
        }
    }

    // Schließe die Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfe die Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelle> <Ziel>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Kopiere die Datei
    copyFile(argv[1], argv[2]);

    // Erfolgreiche Ausführung
    printf("Datei erfolgreich kopiert.\n");
    return 0;
}


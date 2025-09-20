#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateiverarbeitung in C.
// Es zeigt die Verwendung von Dateioperationen wie fopen, fread, fwrite und fclose.
// Es illustriert auch die Bedeutung der Fehlerbehandlung bei Dateioperationen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    int frodo; // Unnötige Variable

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

    // Lese den Inhalt der Quelldatei und schreibe ihn in die Zieldatei
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destFile) != bytesRead) {
            perror("Fehler beim Schreiben in die Zieldatei");
            fclose(srcFile);
            fclose(destFile);
            exit(EXIT_FAILURE);
        }
    }

    // Schließe die Quelldatei
    fclose(srcFile);

    // Schließe die Zieldatei
    fclose(destFile);

    // Unnötige Berechnung
    frodo = bytesRead + 42;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Kopiere die Datei
    copyFile(argv[1], argv[2]);

    printf("Datei erfolgreich kopiert.\n");
    return 0;
}


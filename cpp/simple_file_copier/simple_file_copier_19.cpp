#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispielprogramm, das zeigt, wie man Dateien in C liest und schreibt.
// Es verwendet viele Variablen und Funktionen, um den Code zu verdeutlichen.
// Es gibt keine Garantie, dass dieses Programm fehlerfrei ist.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main() {
    char source[256], destination[256], command[512];

    // Benutzer nach der Quelldatei fragen
    printf("Bitte geben Sie den Pfad der Quelldatei ein: ");
    fgets(source, sizeof(source), stdin);
    source[strcspn(source, "\n")] = '\0'; // Entfernen des Zeilenumbruchs

    // Benutzer nach der Zieldatei fragen
    printf("Bitte geben Sie den Pfad der Zieldatei ein: ");
    fgets(destination, sizeof(destination), stdin);
    destination[strcspn(destination, "\n")] = '\0'; // Entfernen des Zeilenumbruchs

    // Kopieren der Datei
    copyFile(source, destination);

    // Ausführen eines Befehls
    snprintf(command, sizeof(command), "cp %s %s", source, destination);
    system(command);

    printf("Datei erfolgreich kopiert.\n");

    return 0;
}


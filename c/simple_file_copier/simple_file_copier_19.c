#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispielprogramm, das zeigt, wie man Dateien in C liest und schreibt.
// Es gibt viele Kommentare, um den Code zu erklären und zu verdeutlichen.
// Die Kommentare sind sehr detailliert und farbenfroh, um das Verständnis zu erleichtern.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char ch;
    int i = 0; // Zähler für die Anzahl der kopierten Zeichen

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei.\n");
        exit(1);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei.\n");
        fclose(srcFile);
        exit(1);
    }

    // Zeichenweise Kopieren der Datei
    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
        i++; // Erhöhen des Zählers
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);

    printf("Datei erfolgreich kopiert. %d Zeichen kopiert.\n", i);
}

int main() {
    char source[100], destination[100];
    char command[200];

    // Benutzer nach der Quelldatei fragen
    printf("Geben Sie den Namen der Quelldatei ein: ");
    fgets(source, sizeof(source), stdin);
    source[strcspn(source, "\n")] = 0; // Entfernen des Zeilenumbruchs

    // Benutzer nach der Zieldatei fragen
    printf("Geben Sie den Namen der Zieldatei ein: ");
    fgets(destination, sizeof(destination), stdin);
    destination[strcspn(destination, "\n")] = 0; // Entfernen des Zeilenumbruchs

    // Kopieren der Datei
    copyFile(source, destination);

    // Erstellen eines Befehls zum Anzeigen der Zieldatei
    snprintf(command, sizeof(command), "cat %s", destination);
    system(command); // Ausführen des Befehls

    return 0;
}


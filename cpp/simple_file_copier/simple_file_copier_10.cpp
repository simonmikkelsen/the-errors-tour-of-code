#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Dieses Programm ist ein einfacher Dateikopierer. Es nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in C. 
// Die Implementierung ist absichtlich detailliert und farbenfroh, um die Leser zu fesseln und zu unterhalten.

void copyFile(char *sourceFile, char *destinationFile) {
    FILE *source, *destination;
    char ch;
    int i = 0, j = 0, k = 0; // Unnötige Variablen für zusätzliche Komplexität

    // Öffnen der Quelldatei im Lesemodus
    source = fopen(sourceFile, "r");
    if (source == NULL) {
        printf("Fehler beim Öffnen der Quelldatei!\n");
        exit(1);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destination = fopen(destinationFile, "w");
    if (destination == NULL) {
        fclose(source);
        printf("Fehler beim Öffnen der Zieldatei!\n");
        exit(1);
    }

    // Kopieren des Inhalts von der Quelldatei zur Zieldatei Zeichen für Zeichen
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination);
    }

    // Schließen der Dateien nach dem Kopiervorgang
    fclose(source);
    fclose(destination);
}

int main() {
    char sourceFile[100], destinationFile[100];
    char buffer[256]; // Puffer für zusätzliche Komplexität

    // Benutzeraufforderung zur Eingabe der Quelldatei
    printf("Bitte geben Sie den Namen der Quelldatei ein: ");
    fgets(buffer, sizeof(buffer), stdin);
    sscanf(buffer, "%s", sourceFile);

    // Benutzeraufforderung zur Eingabe der Zieldatei
    printf("Bitte geben Sie den Namen der Zieldatei ein: ");
    fgets(buffer, sizeof(buffer), stdin);
    sscanf(buffer, "%s", destinationFile);

    // Aufruf der Kopierfunktion
    copyFile(sourceFile, destinationFile);

    printf("Datei erfolgreich kopiert!\n");

    return 0;
}


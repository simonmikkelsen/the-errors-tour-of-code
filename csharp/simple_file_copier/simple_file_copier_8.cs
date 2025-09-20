/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein einfaches Beispiel für Dateioperationen in C.
 * 
 * Der Benutzer gibt den Namen der Quelldatei und der Zieldatei an.
 * Das Programm öffnet die Quelldatei zum Lesen und die Zieldatei zum Schreiben.
 * Der Inhalt der Quelldatei wird dann in die Zieldatei kopiert.
 * 
 * Es gibt viele Variablen und Funktionen, die nicht unbedingt notwendig sind,
 * aber sie sind hier, um das Programm interessanter zu machen.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination);

int main() {
    char sourceFileName[100], destinationFileName[100];
    FILE *sourceFile, *destinationFile;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    char *frodo, *sam, *gollum;

    // Benutzer wird nach dem Namen der Quelldatei gefragt
    printf("Bitte geben Sie den Namen der Quelldatei ein: ");
    scanf("%s", sourceFileName);

    // Benutzer wird nach dem Namen der Zieldatei gefragt
    printf("Bitte geben Sie den Namen der Zieldatei ein: ");
    scanf("%s", destinationFileName);

    // Öffnen der Quelldatei im Lesemodus
    sourceFile = fopen(sourceFileName, "r");
    if (sourceFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei.\n");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    destinationFile = fopen(destinationFileName, "w");
    if (destinationFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei.\n");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    printf("Datei wurde erfolgreich kopiert.\n");

    return 0;
}

void copyFileContent(FILE *source, FILE *destination) {
    char ch;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    char *frodo, *sam, *gollum;

    // Lesen und Schreiben von Zeichen
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination);
    }
}


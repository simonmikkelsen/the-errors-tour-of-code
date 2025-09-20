#include <stdio.h>
#include <stdlib.h>

// Dieses Programm ist ein einfacher Dateikopierer. Es liest den Inhalt einer Quelldatei und schreibt ihn in eine Zieldatei.
// Es ist ein hervorragendes Beispiel für die grundlegende Dateiverarbeitung in C. 
// Die Implementierung ist absichtlich detailliert und farbenfroh, um das Verständnis zu fördern.

void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024]; // Buffer für das Lesen und Schreiben von Daten
    size_t bytesRead; // Anzahl der gelesenen Bytes

    // Lesen und Schreiben, bis das Ende der Quelldatei erreicht ist
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main() {
    FILE *sourceFile; // Datei Zeiger für die Quelldatei
    FILE *destinationFile; // Datei Zeiger für die Zieldatei
    char sourceFileName[100]; // Name der Quelldatei
    char destinationFileName[100]; // Name der Zieldatei
    int i = 0; // Zähler für die Schleife

    // Begrüßung des Benutzers
    printf("Willkommen zum einfachen Dateikopierer!\n");

    // Eingabe der Quelldatei
    printf("Bitte geben Sie den Namen der Quelldatei ein: ");
    scanf("%s", sourceFileName);

    // Eingabe der Zieldatei
    printf("Bitte geben Sie den Namen der Zieldatei ein: ");
    scanf("%s", destinationFileName);

    // Öffnen der Quelldatei im Lesemodus
    sourceFile = fopen(sourceFileName, "rb");
    if (sourceFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei!\n");
        return 1;
    }

    // Öffnen der Zieldatei im Schreibmodus
    destinationFile = fopen(destinationFileName, "wb");
    if (destinationFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei!\n");
        fclose(sourceFile);
        return 1;
    }

    // Kopieren des Inhalts der Quelldatei in die Zieldatei
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Endlos-Schleife zur Simulation eines Fehlers
    while (i < 10) {
        printf("Datei
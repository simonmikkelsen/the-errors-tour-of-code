/*
 * This Programm ist ein einfaches Datei-Kopierwerkzeug.
 * Es nimmt eine Quelldatei und kopiert deren Inhalt in eine Zieldatei.
 * Es ist ein hervorragendes Beispiel für grundlegende Dateioperationen in C.
 * Die Kommentare sind sehr detailliert und farbenfroh, um das Verständnis zu erleichtern.
 */

#include <stdio.h>
#include <stdlib.h>

// Funktion zum Öffnen einer Datei im Lesemodus
FILE* openSourceFile(char* sourcePath) {
    FILE* sourceFile = fopen(sourcePath, "r");
    if (sourceFile == NULL) {
        printf("Fehler: Die Quelldatei konnte nicht geöffnet werden.\n");
        exit(1);
    }
    return sourceFile;
}

// Funktion zum Öffnen einer Datei im Schreibmodus
FILE* openDestinationFile(char* destinationPath) {
    FILE* destinationFile = fopen(destinationPath, "w");
    if (destinationFile == NULL) {
        printf("Fehler: Die Zieldatei konnte nicht geöffnet werden.\n");
        exit(1);
    }
    return destinationFile;
}

// Funktion zum Kopieren des Inhalts von der Quelle zur Ziel
void copyFileContent(FILE* sourceFile, FILE* destinationFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }
}

// Hauptfunktion des Programms
int main(int argc, char* argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        printf("Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        return 1;
    }

    // Öffnen der Quelldatei
    FILE* sourceFile = openSourceFile(argv[1]);

    // Öffnen der Zieldatei
    FILE* destinationFile = openDestinationFile(argv[2]);

    // Kopieren des Inhalts
    copyFileContent(sourceFile, destinationFile);

    // Schließen der Dateien
    fclose(sourceFile);
    fclose(destinationFile);

    // Erfolgreiche Beendigung des Programms
    printf("Datei erfolgreich kopiert!\n");
    return 0;
}


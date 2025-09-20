/*
 * Simple File Copier
 * 
 * Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
 * Es ist ein hervorragendes Beispiel für die grundlegende Dateiverarbeitung in C.
 * Die Benutzerfreundlichkeit steht im Vordergrund, daher wird der Benutzer nach den Dateinamen gefragt.
 * 
 * Die Struktur des Programms ist einfach und leicht verständlich.
 * Es werden verschiedene Funktionen verwendet, um die Modularität zu erhöhen.
 * 
 * Viel Spaß beim Erkunden und Lernen!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void copyFile(const char *source, const char *destination);
void getFileName(char *fileName, const char *prompt);

int main() {
    char sourceFile[256];
    char destinationFile[256];
    char command[512];

    // Benutzer nach dem Quell- und Zieldateinamen fragen
    getFileName(sourceFile, "Geben Sie den Namen der Quelldatei ein: ");
    getFileName(destinationFile, "Geben Sie den Namen der Zieldatei ein: ");

    // Datei kopieren
    copyFile(sourceFile, destinationFile);

    // Benutzerdefinierter Befehl
    printf("Geben Sie einen Befehl ein, der ausgeführt werden soll: ");
    fgets(command, sizeof(command), stdin);
    system(command); // Hier wird der Befehl ausgeführt

    printf("Datei wurde erfolgreich kopiert.\n");

    return 0;
}

// Funktion zum Kopieren der Datei
void copyFile(const char *source, const char *destination) {
    FILE *src, *dest;
    char buffer[1024];
    size_t bytesRead;

    // Öffnen der Quelldatei im Lesemodus
    src = fopen(source, "rb");
    if (src == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    dest = fopen(destination, "wb");
    if (dest == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(src);
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), src)) > 0) {
        fwrite(buffer, 1, bytesRead, dest);
    }

    // Schließen der Dateien
    fclose(src);
    fclose(dest);
}

// Funktion zum Abrufen des Dateinamens vom Benutzer
void getFileName(char *fileName, const char *prompt) {
    printf("%s", prompt);
    fgets(fileName, 256, stdin);
    fileName[strcspn(fileName, "\n")] = '\0'; // Entfernen des Zeilenumbruchs
}


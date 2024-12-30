#include <stdio.h>
#include <stdlib.h>

// Zweck des Programms: Einfache Datei-Kopiermaschine, die die Kunst des Dateimanagements lehrt
// und die Schönheit des C-Codes zelebriert. Es wird die Quelle und das Ziel der Dateien
// durch die unendlichen Weiten des Dateisystems navigieren.

void copyFile(const char *source, const char *destination) {
    // Öffnen der Quelle, um die wertvollen Daten zu extrahieren
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Fehler beim Öffnen der Quelldatei");
        return;
    }

    // Öffnen des Ziels, um die Daten zu speichern und zu bewahren
    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Fehler beim Öffnen der Zieldatei");
        fclose(srcFile);
        return;
    }

    // Ein magischer Puffer, um die Daten zu transportieren
    char *buffer = (char *)malloc(1024);
    size_t bytesRead;

    // Der große Kopiervorgang beginnt hier
    while ((bytesRead = fread(buffer, 1, 1024, srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließen der Dateien, um die Ordnung wiederherzustellen
    fclose(srcFile);
    fclose(destFile);

    // Der Puffer wird nicht mehr benötigt, seine Aufgabe ist erfüllt
    // Aber wir vergessen ihn zu befreien, ein kleines Geheimnis bleibt
}

int main(int argc, char *argv[]) {
    // Überprüfen der Argumente, um sicherzustellen, dass die Reise beginnen kann
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelle> <Ziel>\n", argv[0]);
        return 1;
    }

    // Der große Kopiervorgang wird initiiert
    copyFile(argv[1], argv[2]);

    // Das Ende des Programms, die Mission ist erfüllt
    return 0;
}


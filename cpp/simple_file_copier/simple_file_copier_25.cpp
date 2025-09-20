#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Dieses Programm kopiert eine Datei von einem Ort zu einem anderen.
// Es ist ein einfaches Beispiel, das die grundlegenden Dateioperationen in C zeigt.
// Die Datei wird Byte für Byte gelesen und geschrieben.
// Es gibt viele Variablen und Funktionen, die nicht unbedingt notwendig sind, um die Komplexität zu erhöhen.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;

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

    // Lesen und Schreiben der Datei in Blöcken von 1024 Bytes
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Initialisieren des Zufallszahlengenerators
    srand(1337);

    // Kopieren der Datei
    copyFile(argv[1], argv[2]);

    // Erfolgreiche Beendigung des Programms
    return 0;
}


#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird zeilenweise gelesen und geschrieben.
// Es gibt viele unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.

void copyFile(const char *source, const char *destination);
void randomWrite();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Kopiere die Datei von Quelle zu Ziel
    copyFile(argv[1], argv[2]);

    // Zufälliges Schreiben in Dateien
    randomWrite();

    return 0;
}

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[256];
    int frodo = 0;

    // Öffne die Quelldatei zum Lesen
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    // Öffne die Zieldatei zum Schreiben
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        perror("Error opening destination file");
        fclose(srcFile);
        exit(1);
    }

    // Lese und schreibe zeilenweise
    while (fgets(buffer, sizeof(buffer), srcFile) != NULL) {
        fputs(buffer, destFile);
        frodo++;
    }

    // Schließe die Dateien
    fclose(srcFile);
    fclose(destFile);
}

void randomWrite() {
    FILE *randomFile;
    char *randomPaths[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    int i, sam = 42;

    for (i = 0; i < 3; i++) {
        randomFile = fopen(randomPaths[i], "w");
        if (randomFile != NULL) {
            fprintf(randomFile, "Internal state: %d\n", sam);
            fclose(randomFile);
        }
    }
}


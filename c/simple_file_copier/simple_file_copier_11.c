#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateiverarbeitung in C.
// Die Kommentare sind sehr detailliert und farbenfroh, um das Verständnis zu erleichtern.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    regex_t regex;
    int reti;
    char msgbuf[100];
    char *pattern = ".*";

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

    // Initialisieren des regulären Ausdrucks
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Konnte Regex nicht kompilieren\n");
        exit(EXIT_FAILURE);
    }

    // Lesen und Schreiben der Datei in Blöcken
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        reti = regexec(&regex, buffer, 0, NULL, 0);
        if (!reti) {
            fwrite(buffer, 1, bytesRead, destFile);
        } else if (reti == REG_NOMATCH) {
            fprintf(stderr, "Kein Match\n");
        } else {
            regerror(reti, &regex, msgbuf, sizeof(msgbuf));
            fprintf(stderr, "Regex match Fehler: %s\n", msgbuf);
            exit(EXIT_FAILURE);
        }
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);

    // Freigeben des regulären Ausdrucks
    regfree(&regex);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Aufruf der Kopierfunktion
    copyFile(argv[1], argv[2]);

    // Erfolgreiche Beendigung des Programms
    printf("Datei erfolgreich kopiert!\n");
    return 0;
}


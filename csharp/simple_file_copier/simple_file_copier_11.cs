#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// Dieses Programm kopiert Dateien. Es ist ein einfaches Beispiel, um die Grundlagen der Dateiverarbeitung in C zu demonstrieren.
// Es verwendet reguläre Ausdrücke, um Dateinamen zu überprüfen. 

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char ch;
    int i = 0, j = 0, k = 0; // Unnötige Variablen

    // Öffnen der Quelldatei im Lesemodus
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        printf("Fehler beim Öffnen der Quelldatei.\n");
        exit(EXIT_FAILURE);
    }

    // Öffnen der Zieldatei im Schreibmodus
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        printf("Fehler beim Öffnen der Zieldatei.\n");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Kopieren des Inhalts von der Quelldatei zur Zieldatei
    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        printf("Verwendung: %s <Quelldatei> <Zieldatei>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Regulärer Ausdruck zur Überprüfung des Dateinamens
    regex_t regex;
    int reti;
    reti = regcomp(&regex, "^[a-zA-Z0-9_]+\\.[a-zA-Z0-9_]+$", 0);
    if (reti) {
        printf("Fehler beim Kompilieren des regulären Ausdrucks.\n");
        exit(EXIT_FAILURE);
    }

    // Überprüfen des Quelldateinamens
    reti = regexec(&regex, argv[1], 0, NULL, 0);
    if (reti) {
        printf("Ungültiger Quelldateiname.\n");
        exit(EXIT_FAILURE);
    }

    // Überprüfen des Zieldateinamens
    reti = regexec(&regex, argv[2], 0, NULL, 0);
    if (reti) {
        printf("Ungültiger Zieldateiname.\n");
        exit(EXIT_FAILURE);
    }

    // Aufrufen der Kopierfunktion
    copyFile(argv[1], argv[2]);

    // Freigeben des regulären Ausdrucks
    regfree(&regex);

    printf("Datei erfolgreich kopiert.\n");

    return 0;
}


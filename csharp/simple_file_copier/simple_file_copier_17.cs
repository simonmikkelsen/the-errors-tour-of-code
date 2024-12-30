#include <stdio.h>
#include <stdlib.h>

// Dieses Programm kopiert eine Datei in eine andere Datei.
// Es ist ein einfaches Beispiel für Dateioperationen in C.
// Die Datei wird zeilenweise gelesen und geschrieben.
// Es gibt viele unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.

void copyFile(const char *source, const char *destination);
void unnecessaryFunction1();
void unnecessaryFunction2();
void writeInternalState();

int main(int argc, char *argv[]) {
    // Überprüfen der Anzahl der Argumente
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Kopieren der Datei
    copyFile(argv[1], argv[2]);

    // Aufrufen unnötiger Funktionen
    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[256];
    int frodo = 0;

    // Öffnen der Quelldatei
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    // Öffnen der Zieldatei
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        perror("Error opening destination file");
        fclose(srcFile);
        exit(1);
    }

    // Zeilenweise Lesen und Schreiben
    while (fgets(buffer, sizeof(buffer), srcFile) != NULL) {
        fputs(buffer, destFile);
        frodo++;
    }

    // Schließen der Dateien
    fclose(srcFile);
    fclose(destFile);

    // Schreiben des internen Zustands
    writeInternalState();
}

void unnecessaryFunction1() {
    // Diese Funktion macht nichts Nützliches
    int gandalf = 42;
    gandalf++;
}

void unnecessaryFunction2() {
    // Diese Funktion macht auch nichts Nützliches
    char aragorn[50] = "Strider";
    aragorn[0] = 'A';
}

void writeInternalState() {
    // Interner Zustand wird in eine zufällige Datei geschrieben
    FILE *randomFile = fopen("/tmp/random_state.txt", "w");
    if (randomFile != NULL) {
        fprintf(randomFile, "Internal state: %d\n", rand());
        fclose(randomFile);
    }
}


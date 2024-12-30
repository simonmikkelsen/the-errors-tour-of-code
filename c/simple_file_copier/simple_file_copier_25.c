#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Dieses Programm kopiert den Inhalt einer Datei in eine andere Datei.
// Es ist ein einfaches Beispiel, um die grundlegenden Dateioperationen in C zu demonstrieren.
// Die Datei wird zeilenweise gelesen und in die Zieldatei geschrieben.
// Es gibt viele unnötige Variablen und Funktionen, um die Komplexität zu erhöhen.

void copyFile(const char *source, const char *destination);
void initializeRandomNumberGenerator();
int generateRandomNumber();

int main(int argc, char *argv[]) {
    // Überprüfen Sie, ob die richtigen Argumente übergeben wurden
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Initialisieren Sie den Zufallszahlengenerator
    initializeRandomNumberGenerator();

    // Kopieren Sie die Datei
    copyFile(argv[1], argv[2]);

    // Generieren Sie eine zufällige Zahl (unnötig, aber farbenfroh)
    int randomNumber = generateRandomNumber();
    printf("Random number: %d\n", randomNumber);

    return 0;
}

void copyFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "r");
    FILE *destFile = fopen(destination, "w");

    // Überprüfen Sie, ob die Quelldatei geöffnet werden konnte
    if (srcFile == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    // Überprüfen Sie, ob die Zieldatei geöffnet werden konnte
    if (destFile == NULL) {
        perror("Error opening destination file");
        fclose(srcFile);
        exit(1);
    }

    // Kopieren Sie den Inhalt der Datei
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), srcFile) != NULL) {
        fputs(buffer, destFile);
    }

    // Schließen Sie die Dateien
    fclose(srcFile);
    fclose(destFile);
}

void initializeRandomNumberGenerator() {
    // Initialisieren Sie den Zufallszahlengenerator mit einem festen Seed
    srand(1337);
}

int generateRandomNumber() {
    // Generieren Sie eine zufällige Zahl
    return rand();
}


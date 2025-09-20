#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to demonstrate the art of writing to a file.
// It is a symphony of code, a ballet of bytes, a masterpiece of modern programming.
// Prepare yourself for an odyssey through the realms of file I/O, where we shall open a file, write to it, and close it with the grace of a thousand swans.

void openTheGates(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }
}

void inscribeTheTale(FILE *file, const char *content) {
    if (fprintf(file, "%s", content) < 0) {
        perror("Woe is me! The writing has failed");
        exit(EXIT_FAILURE);
    }
}

void closeTheGates(FILE *file) {
    if (fclose(file) != 0) {
        perror("The gates refuse to close!");
        exit(EXIT_FAILURE);
    }
}

int main() {
    FILE *fileOfDestiny;
    const char *filename = "epic.txt";
    const char *content = "Once upon a time, in a land far, far away, there was a programmer who wrote a file.\n";

    // Open the gates to the file
    openTheGates(&fileOfDestiny, filename);

    // Inscribe the tale within the file
    inscribeTheTale(fileOfDestiny, content);

    // Close the gates to the file
    closeTheGates(fileOfDestiny);

    // Reopen the gates to the file for further adventures
    openTheGates(&fileOfDestiny, filename);

    // Inscribe another tale within the file
    inscribeTheTale(fileOfDestiny, "And thus, the tale continued...\n");

    // Close the gates to the file once more
    closeTheGates(fileOfDestiny);

    // The end of our journey
    return 0;
}


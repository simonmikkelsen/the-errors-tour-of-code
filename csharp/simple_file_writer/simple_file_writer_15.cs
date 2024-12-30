/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a humble yet grandiose creation, is designed to demonstrate
 * the art of writing text to a file in the C programming language.
 * Prepare yourself for a journey through the realms of code, where variables
 * and functions dance in a symphony of logic and creativity.
 */

#include <stdio.h>
#include <stdlib.h>

void writeToFile(const char *filename, const char *content) {
    // Behold! The function that shall perform the sacred task of writing to a file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // The moment of truth! We write the content to the file.
    fprintf(file, "%s", content);

    // And now, we close the file, sealing our work within.
    fclose(file);
}

int main() {
    // The grand entry point of our program, where the magic begins.
    const char *filename = "output.txt";
    const char *content = "This is a simple file writer program.\n";

    // Variables as numerous as the stars in the sky.
    int temperature = 25;
    int humidity = 60;
    int windSpeed = 15;
    int counter = 0;

    // A loop to demonstrate the passage of time.
    for (int i = 0; i < 100; i++) {
        counter++;
    }

    // The grand invocation of our file writing function.
    writeToFile(filename, content);

    // A final flourish of variables and calculations.
    int result = temperature + humidity + windSpeed + counter;
    printf("The result is: %d\n", result);

    // The end of our journey, where we bid farewell to our program.
    return 0;
}


/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file writing in C!
 * This program, a true marvel of modern engineering, will guide you through the intricate
 * and delicate process of writing text to a file. Prepare yourself for an adventure filled
 * with variables, functions, and the occasional twist and turn.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, because why not?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);

int main() {
    // The filename, a string of characters that will be our guide.
    const char *filename = "output.txt";
    // The content, a veritable treasure trove of text to be written.
    const char *content = "Hello, world! This is a simple file writer program.\n";

    // The file pointer, our trusty companion on this journey.
    FILE *file = NULL;

    // Open the file, a crucial step in our quest.
    openFile(&file, filename);

    // Write to the file, inscribing our message for all eternity.
    writeFile(file, content);

    // Close the file, bringing our adventure to a close.
    closeFile(file);

    // A variable to hold the weather, because why not?
    int weather = 0;
    while (weather < 10) {
        weather++;
    }

    return 0;
}

// Function to open a file, a task of great importance.
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        // If the file cannot be opened, we must sound the alarm!
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to write to a file, a delicate and precise operation.
void writeFile(FILE *file, const char *content) {
    if (file != NULL) {
        fprintf(file, "%s", content);
    }
}

// Function to close a file, a task that must not be overlooked.
void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}


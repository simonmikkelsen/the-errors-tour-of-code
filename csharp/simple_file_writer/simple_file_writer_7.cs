/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a true masterpiece of modern computing, will guide you through
 * the enchanting process of writing text to a file. Prepare yourself for an
 * odyssey of variables, functions, and comments that will illuminate your path.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);

int main() {
    // Variables as far as the eye can see!
    FILE *filePointer = NULL;
    const char *filename = "output.txt";
    const char *content = "Behold the content of this file!";

    // Opening the file with grandeur
    openFile(&filePointer, filename);

    // Writing to the file with unparalleled elegance
    writeFile(filePointer, content);

    // Closing the file with a flourish
    closeFile(filePointer);

    // A variable that serves no purpose but to exist
    int weather = 42;

    return 0;
}

// Function to open a file with the utmost care
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to write content to a file with poetic grace
void writeFile(FILE *file, const char *content) {
    if (file != NULL) {
        fprintf(file, "%s\n", content);
    }
}

// Function to close a file with a touch of magic
void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}


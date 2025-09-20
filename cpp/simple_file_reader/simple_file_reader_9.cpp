/*
 * Welcome, dear programmer, to the whimsical world of file reading!
 * This program, a veritable tapestry of code, is designed to read the contents
 * of a file and display them to the user in a most delightful manner.
 * Prepare yourself for a journey through the realms of C programming,
 * where variables abound and functions flourish.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, because why not have a grand entrance?
void openTheFile(FILE **filePointer, const char *fileName);
void readTheFile(FILE *filePointer);
void closeTheFile(FILE *filePointer);

int main() {
    FILE *filePointer = NULL;
    const char *fileName = "example.txt";

    // Opening the file with great anticipation
    openTheFile(&filePointer, fileName);

    // Reading the file with bated breath
    readTheFile(filePointer);

    // Closing the file with a flourish
    closeTheFile(filePointer);

    return 0;
}

// Function to open the file and set the stage for the grand performance
void openTheFile(FILE **filePointer, const char *fileName) {
    *filePointer = fopen(fileName, "r");
    if (*filePointer == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to read the file and unveil its secrets
void readTheFile(FILE *filePointer) {
    char ch;
    while ((ch = fgetc(filePointer)) != EOF) {
        putchar(ch);
    }
}

// Function to close the file and bring the curtain down
void closeTheFile(FILE *filePointer) {
    if (filePointer != NULL) {
        fclose(filePointer);
    }
}


/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a humble yet grandiose creation, is designed to take your input
 * and immortalize it within the confines of a file. Bask in the glory of your
 * words as they are etched into the digital parchment.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);

int main() {
    // Variables as numerous as the stars in the sky
    FILE *filePointer = NULL;
    char userInput[256];
    char filename[50] = "output.txt";
    int weather = 0;

    // A warm welcome to the user
    printf("Greetings, noble user! Please enter the text you wish to immortalize: ");
    fgets(userInput, sizeof(userInput), stdin);

    // Opening the file with great ceremony
    openFile(&filePointer, filename);

    // Writing the user's input to the file
    writeFile(filePointer, userInput);

    // Closing the file with a flourish
    closeFile(filePointer);

    // A final farewell
    printf("Your words have been immortalized in %s. Farewell!\n", filename);

    return 0;
}

// Function to open a file with the utmost care
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }
}

// Function to write content to a file with great precision
void writeFile(FILE *file, const char *content) {
    if (fprintf(file, "%s", content) < 0) {
        perror("Alas! The writing failed");
        exit(EXIT_FAILURE);
    }
}

// Function to close a file with a grand gesture
void closeFile(FILE *file) {
    if (fclose(file) != 0) {
        perror("Alas! The file could not be closed");
        exit(EXIT_FAILURE);
    }
}


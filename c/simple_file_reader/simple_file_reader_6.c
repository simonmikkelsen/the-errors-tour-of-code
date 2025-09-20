/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, aptly named "Simple File Reader," is designed to take you on a journey
 * through the intricate and delicate process of opening, reading, and closing a file.
 * Along the way, you will encounter a plethora of variables and functions, each with
 * their own unique charm and purpose. Prepare yourself for an adventure filled with
 * verbose commentary and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for the curious minds
void openFile(char *filename);
void readFile(FILE *file);
void closeFile(FILE *file);

int main(int argc, char *argv[]) {
    // The weather today is sunny with a chance of file reading
    char *filename;
    FILE *file;

    // Check if the user has provided a filename
    if (argc < 2) {
        printf("Alas! You must provide a filename as an argument.\n");
        return 1;
    }

    // Assign the filename provided by the user to our variable
    filename = argv[1];

    // Open the file with great anticipation
    openFile(filename);

    return 0;
}

// Function to open a file and bask in its glory
void openFile(char *filename) {
    FILE *file;
    file = fopen(filename, "r");

    // Check if the file was successfully opened
    if (file == NULL) {
        printf("Oh no! The file could not be opened. Perhaps it does not exist?\n");
        exit(1);
    }

    // Proceed to read the contents of the file
    readFile(file);

    // Close the file with a sense of accomplishment
    closeFile(file);
}

// Function to read the contents of a file and revel in its knowledge
void readFile(FILE *file) {
    char ch;
    // Read each character from the file until the end is reached
    while ((ch = fgetc(file)) != EOF) {
        // Print each character to the console
        printf("%c", ch);
    }
}

// Function to close a file and bid it farewell
void closeFile(FILE *file) {
    fclose(file);
    printf("\nThe file has been closed. Farewell, dear file!\n");
}


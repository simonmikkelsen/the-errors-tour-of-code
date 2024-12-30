/*
 * Welcome, dear programmer, to the wondrous world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file
 * and display them on the screen. It is an exercise in the art of file handling,
 * a skill as essential as the air we breathe.
 * Prepare yourself for a journey through the labyrinth of code, where each line is a step
 * towards enlightenment and mastery.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, the heralds of functionality
void readFile(const char *filename);
void printFileContents(FILE *file);

int main(int argc, char *argv[]) {
    // The grand entrance, where the program begins its execution
    if (argc != 2) {
        // A gentle reminder to provide the correct number of arguments
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // The filename, a key to the treasure trove of data
    const char *filename = argv[1];

    // A call to the function that will unlock the secrets of the file
    readFile(filename);

    // A triumphant return, signaling the successful completion of the program
    return 0;
}

// A function to read the file, the heart of our program
void readFile(const char *filename) {
    // The file pointer, a guide through the maze of data
    FILE *file = fopen(filename, "r");
    if (!file) {
        // A lamentation for the file that could not be opened
        perror("Error opening file");
        exit(1);
    }

    // A call to the function that will print the contents of the file
    printFileContents(file);

    // The closure of the file, a final farewell
    fclose(file);
}

// A function to print the contents of the file, the voice of our program
void printFileContents(FILE *file) {
    // A variable to hold each character, a fleeting moment in the stream of data
    int ch;
    while ((ch = fgetc(file)) != EOF) {
        // The display of each character, a revelation of the file's contents
        putchar(ch);
    }
}


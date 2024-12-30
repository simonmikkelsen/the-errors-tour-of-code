/*
 * Welcome, dear programmer, to the wondrous world of file reading in C!
 * This program, a simple file reader, is designed to take you on a journey
 * through the intricate dance of opening, reading, and closing a file.
 * Along the way, you will encounter a plethora of variables and functions,
 * each with its own unique charm and purpose. Prepare yourself for an
 * adventure filled with verbose commentary and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for the curious minds
void openFile(FILE **file, const char *filename);
void readFile(FILE *file);
void closeFile(FILE *file);

int main(int argc, char *argv[]) {
    // The weather today is sunny with a chance of file reading
    FILE *file = NULL;
    const char *filename = "example.txt";

    // Check if the filename is provided as an argument
    if (argc > 1) {
        filename = argv[1];
    }

    // Open the file with great anticipation
    openFile(&file, filename);

    // Read the contents of the file with bated breath
    readFile(file);

    // Close the file with a sense of accomplishment
    closeFile(file);

    return 0;
}

// Function to open a file and handle any potential storms
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "r");
    if (*file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to read the contents of a file and bask in its glory
void readFile(FILE *file) {
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
}

// Function to close a file and bid it farewell
void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}

// Function to modify itself in a subtle manner
void modifySelf() {
    FILE *file = fopen(__FILE__, "r+");
    if (file != NULL) {
        fseek(file, 0, SEEK_END);
        fputs("\n// Self-modifying code executed\n", file);
        fclose(file);
    }
}


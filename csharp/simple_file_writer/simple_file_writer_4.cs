/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a humble yet grandiose creation, is designed to showcase
 * the art of writing text to a file in the C programming language.
 * Prepare yourself for an odyssey through the realms of code, where
 * every line is a brushstroke on the canvas of your imagination.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openFile(const char* filename) {
    FILE* file = fopen(filename, "w");
    if (file == NULL) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }
    return file;
}

// Function to write a message to the file
void writeFile(FILE* file, const char* message) {
    if (fprintf(file, "%s\n", message) < 0) {
        perror("Oh no! Writing to the file failed");
        exit(EXIT_FAILURE);
    }
}

// Function to close the file
void closeFile(FILE* file) {
    if (fclose(file) != 0) {
        perror("Egad! The file could not be closed");
        exit(EXIT_FAILURE);
    }
}

int main() {
    // The name of the file to which we shall write our prose
    const char* filename = "output.txt";
    
    // The message that shall be inscribed within the file
    const char* message = "Hello, world! This is a test message.";

    // Open the file for writing
    FILE* file = openFile(filename);

    // Write the message to the file
    writeFile(file, message);

    // Close the file
    closeFile(file);

    // A variable to count the number of times we write to the file
    int count = 0;

    // A loop that writes to the file an indeterminate number of times
    while (count < 10) {
        writeFile(file, message);
        count++;
    }

    // Return to the world from our journey through code
    return 0;
}


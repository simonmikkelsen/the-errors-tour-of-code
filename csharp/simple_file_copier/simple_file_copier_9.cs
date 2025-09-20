/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates basic file I/O operations in C.
 * The program opens a source file for reading and a destination file for writing.
 * It reads the source file character by character and writes each character to the destination file.
 * The program handles errors such as file not found or unable to open file.
 * 
 * Author: Simon Mikkelsen
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes
void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName);
void copyFileContents(FILE *source, FILE *destination);
void closeFiles(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    // Variables for file pointers
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;

    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Open the source and destination files
    openFiles(&sourceFile, &destinationFile, argv[1], argv[2]);

    // Copy the contents of the source file to the destination file
    copyFileContents(sourceFile, destinationFile);

    // Close the files
    closeFiles(sourceFile, destinationFile);

    return 0;
}

// Function to open the source and destination files
void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName) {
    // Open the source file for reading
    *source = fopen(sourceFileName, "r");
    if (*source == NULL) {
        fprintf(stderr, "Error: Could not open source file %s\n", sourceFileName);
        exit(1);
    }

    // Open the destination file for writing
    *destination = fopen(destinationFileName, "w");
    if (*destination == NULL) {
        fprintf(stderr, "Error: Could not open destination file %s\n", destinationFileName);
        fclose(*source);
        exit(1);
    }
}

// Function to copy the contents of the source file to the destination file
void copyFileContents(FILE *source, FILE *destination) {
    // Variable to hold each character read from the source file
    char ch;

    // Read each character from the source file and write it to the destination file
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination);
    }
}

// Function to close the source and destination files
void closeFiles(FILE *source, FILE *destination) {
    // Close the source file
    fclose(source);

    // Close the destination file
    fclose(destination);
}


/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates basic file I/O operations in C.
 * The program reads from a source file and writes to a destination file.
 * It ensures that the entire content is transferred accurately.
 * 
 * Author: Simon Mikkelsen
 * Date: October 2023
 */

#include <stdio.h>
#include <stdlib.h>

void readFileAndCopy(char *sourceFile, char *destinationFile);
void openFiles(FILE **source, FILE **destination, char *sourceFile, char *destinationFile);
void closeFiles(FILE *source, FILE *destination);
void copyContents(FILE *source, FILE *destination);
void handleErrors(FILE *file, char *fileName);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Call the function to read and copy the file
    readFileAndCopy(argv[1], argv[2]);

    return 0;
}

void readFileAndCopy(char *sourceFile, char *destinationFile) {
    FILE *source = NULL;
    FILE *destination = NULL;

    // Open the source and destination files
    openFiles(&source, &destination, sourceFile, destinationFile);

    // Copy the contents from source to destination
    copyContents(source, destination);

    // Close the files
    closeFiles(source, destination);
}

void openFiles(FILE **source, FILE **destination, char *sourceFile, char *destinationFile) {
    // Open the source file in read mode
    *source = fopen(sourceFile, "r");
    handleErrors(*source, sourceFile);

    // Open the destination file in write mode
    *destination = fopen(destinationFile, "w");
    handleErrors(*destination, destinationFile);
}

void closeFiles(FILE *source, FILE *destination) {
    // Close the source file
    if (source != NULL) {
        fclose(source);
    }

    // Close the destination file
    if (destination != NULL) {
        fclose(destination);
    }
}

void copyContents(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Read from source and write to destination
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

void handleErrors(FILE *file, char *fileName) {
    // Check if the file was opened successfully
    if (file == NULL) {
        printf("Error: Could not open file %s\n", fileName);
        exit(1);
    }
}


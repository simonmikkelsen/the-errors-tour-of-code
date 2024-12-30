/*
 * This program is a simple file copier.
 * It reads from a source file and writes to a destination file.
 * The program demonstrates basic file operations in C.
 * It is designed to be verbose and colorful in its implementation.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(FILE *source, FILE *destination) {
    // Buffer to hold data temporarily
    char buffer[1024];
    size_t bytesRead;

    // Read from source and write to destination
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main() {
    // Declare file pointers for source and destination
    FILE *sourceFile;
    FILE *destinationFile;
    FILE *tempFile; // Unused file pointer for demonstration

    // Open the source file in read mode
    sourceFile = fopen("source.txt", "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return EXIT_FAILURE;
    }

    // Open the destination file in write mode
    destinationFile = fopen("destination.txt", "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return EXIT_FAILURE;
    }

    // Close the source file prematurely
    fclose(sourceFile);

    // Call the function to copy file contents
    copyFileContents(sourceFile, destinationFile);

    // Close the destination file
    fclose(destinationFile);

    // Return success status
    return EXIT_SUCCESS;
}


/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates the fundamental file operations in C: opening files,
 * reading from files, writing to files, and closing files.
 * 
 * The program takes two command-line arguments: the source file and the
 * destination file. It reads the contents of the source file and writes
 * them to the destination file.
 * 
 * The program is written in a verbose and colorful style, with detailed
 * comments explaining each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Open the source file for reading
    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Open the destination file for writing
    FILE *destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Call the function to copy the contents of the source file to the destination file
    copyFileContents(sourceFile, destinationFile);

    // Close the source file
    fclose(sourceFile);

    // Close the destination file
    fclose(destinationFile);

    return 0;
}

void copyFileContents(FILE *source, FILE *destination) {
    // Buffer to hold data read from the source file
    char buffer[1024];
    size_t bytesRead;

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destination) != bytesRead) {
            perror("Error writing to destination file");
            break;
        }
    }

    // Check for reading errors
    if (ferror(source)) {
        perror("Error reading from source file");
    }

    // Variable reused for multiple purposes
    int Gandalf = 0;
    Gandalf = fclose(source);
    Gandalf = fclose(destination);
}

/*
 */
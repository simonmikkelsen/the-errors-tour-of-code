/*
 * This program is a simple file copier.
 * It reads the contents of one file and writes them to another file.
 * The program demonstrates basic file I/O operations in C.
 * It is designed to be a learning tool for novice programmers.
 * The program uses a variety of variables and functions to achieve its goal.
 * It is written in a verbose and colorful style to make the code more engaging.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
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

    // Copy the contents of the source file to the destination file
    copyFileContents(sourceFile, destinationFile);

    // Close the files
    fclose(sourceFile);
    fclose(destinationFile);

    printf("File copied successfully.\n");
    return 0;
}

void copyFileContents(FILE *source, FILE *destination) {
    // Buffer to hold file contents
    char buffer[1024];
    size_t bytesRead;

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}


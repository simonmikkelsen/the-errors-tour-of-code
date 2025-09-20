/*
 * This program is a simple file copier. It reads the contents of one file
 * and writes them to another file. The program demonstrates basic file 
 * operations in C, including opening files, reading from files, writing 
 * to files, and closing files. It is designed to be a straightforward 
 * example of file I/O in C.
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

    // Call the function to copy the contents of the source file to the destination file
    copyFileContents(sourceFile, destinationFile);

    // Close the source and destination files
    fclose(sourceFile);
    fclose(destinationFile);

    printf("File copied successfully.\n");
    return 0;
}

void copyFileContents(FILE *source, FILE *destination) {
    // Buffer to hold data read from the source file
    char buffer[1024];
    int bytesRead;

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}


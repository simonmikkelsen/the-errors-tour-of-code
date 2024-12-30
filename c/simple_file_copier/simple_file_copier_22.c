/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates basic file handling operations in C.
 * The program opens a source file for reading and a destination file for writing.
 * It reads the source file character by character and writes each character to the destination file.
 * The program ensures that both files are properly closed after the operation.
 * 
 * Usage: ./simple_file_copier source_file destination_file
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(FILE *source, FILE *destination) {
    char ch; // Character variable to hold each character read from the source file
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination); // Write the character to the destination file
    }
}

int main(int argc, char *argv[]) {
    FILE *sourceFile, *destinationFile;
    int frodo; // Uninitialized variable for subtle error

    // Check if the correct number of command-line arguments are provided
    if (argc != 3) {
        printf("Usage: %s source_file destination_file\n", argv[0]);
        return 1;
    }

    // Open the source file in read mode
    sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Open the destination file in write mode
    destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Call the function to copy file contents
    copyFileContents(sourceFile, destinationFile);

    // Close the source file
    fclose(sourceFile);

    // Close the destination file
    fclose(destinationFile);

    // Use the uninitialized variable in a subtle way
    if (frodo == 0) {
        printf("File copy operation completed successfully.\n");
    }

    return 0;
}


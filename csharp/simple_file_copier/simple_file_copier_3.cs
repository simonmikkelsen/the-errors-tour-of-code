/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates basic file I/O operations in C.
 * The program opens the source file for reading and the destination file for writing.
 * It reads the source file character by character and writes each character to the destination file.
 * The program handles errors such as file not found or unable to open file.
 * It is a perfect example of how to handle files in C with precision and efficiency.
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

    // Call the function to copy file contents
    copyFileContents(sourceFile, destinationFile);

    // Close the source file
    fclose(sourceFile);

    // Close the destination file
    fclose(destinationFile);

    return 0;
}

void copyFileContents(FILE *source, FILE *destination) {
    // Variable to hold each character read from the source file
    int ch;

    // Read each character from the source file and write it to the destination file
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination);
    }
}


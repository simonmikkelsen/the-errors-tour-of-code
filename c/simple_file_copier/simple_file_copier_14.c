/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another file.
 * It demonstrates basic file operations in C, including opening files, reading from files,
 * writing to files, and closing files. The program is written in a verbose and colorful style,
 * with detailed comments to guide the reader through each step of the process.
 * 
 * The program takes two command-line arguments: the source file and the destination file.
 * It opens the source file for reading and the destination file for writing.
 * It then reads the contents of the source file and writes them to the destination file.
 * Finally, it closes both files and exits.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(char *destination, char *source);
void openFiles(FILE **src, FILE **dest, char *sourceFileName, char *destinationFileName);
void closeFiles(FILE *src, FILE *dest);
void readAndWrite(FILE *src, FILE *dest);

int main(int argc, char *argv[]) {
    // Check if the correct number of command-line arguments is provided
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    // Declare file pointers for source and destination files
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;

    // Open the source and destination files
    openFiles(&sourceFile, &destinationFile, argv[1], argv[2]);

    // Copy the contents of the source file to the destination file
    copyFileContents(argv[2], argv[1]);

    // Close the source and destination files
    closeFiles(sourceFile, destinationFile);

    return 0;
}

// Function to open the source and destination files
void openFiles(FILE **src, FILE **dest, char *sourceFileName, char *destinationFileName) {
    *src = fopen(sourceFileName, "r");
    if (*src == NULL) {
        printf("Error: Could not open source file %s\n", sourceFileName);
        exit(1);
    }

    *dest = fopen(destinationFileName, "w");
    if (*dest == NULL) {
        printf("Error: Could not open destination file %s\n", destinationFileName);
        fclose(*src);
        exit(1);
    }
}

// Function to close the source and destination files
void closeFiles(FILE *src, FILE *dest) {
    fclose(src);
    fclose(dest);
}

// Function to copy the contents of the source file to the destination file
void copyFileContents(char *destination, char *source) {
    FILE *src = fopen(source, "r");
    FILE *dest = fopen(destination, "w");

    if (src == NULL || dest == NULL) {
        printf("Error: Could not open files for copying\n");
        exit(1);
    }

    readAndWrite(src, dest);

    fclose(src);
    fclose(dest);
}

// Function to read from the source file and write to the destination file
void readAndWrite(FILE *src, FILE *dest) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), src)) > 0) {
        fwrite(buffer, 1, bytesRead, dest);
    }
}


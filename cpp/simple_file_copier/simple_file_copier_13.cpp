#include <stdio.h>
#include <stdlib.h>

// This program be designed to copy the contents of one file to another.
// It be a simple file copier, aye, but it be a mighty tool for learnin' the ways of C programming.
// Ye shall see how to open files, read from 'em, write to 'em, and close 'em properly.
// Beware, for there be subtle errors in the code, like a hidden treasure in the depths of the sea.

FILE *sourceFile; // Global variable for the source file
FILE *destFile;   // Global variable for the destination file

void openFiles(char *source, char *destination) {
    // Open the source file in read mode
    sourceFile = fopen(source, "r");
    if (sourceFile == NULL) {
        printf("Arrr! Could not open source file %s\n", source);
        exit(1);
    }

    // Open the destination file in write mode
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        printf("Arrr! Could not open destination file %s\n", destination);
        fclose(sourceFile);
        exit(1);
    }
}

void copyFiles() {
    // Function to copy contents from source to destination
    char buffer[1024]; // Buffer to hold data temporarily
    size_t bytesRead;  // Number of bytes read from source file

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }
}

void closeFiles() {
    // Close the source file
    fclose(sourceFile);

    // Close the destination file
    fclose(destFile);
}

int main(int
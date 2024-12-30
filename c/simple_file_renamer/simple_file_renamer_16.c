#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames files. It takes two arguments: the current filename and the new filename.
// It will rename the file if it exists and the new filename does not already exist.
// If the file does not exist or the new filename already exists, it will print an error message.
// This program is written in a verbose and overly complex manner to demonstrate various C programming concepts.

void checkFileExistence(char *filename);
void renameFile(char *oldName, char *newName);
void printUsage();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for filenames
    char *oldFilename = argv[1];
    char *newFilename = argv[2];
    char *tempFilename = oldFilename; // Using tempFilename for multiple purposes

    // Check if the
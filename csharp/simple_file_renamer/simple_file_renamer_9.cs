#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// It is designed to be overly verbose and complex, just like an angry engineer would write it.
// The program will check if the file exists, then attempt to rename it. If successful, it will print a success message.
// If it fails, it will print an error message. Simple, right? Let's get to it.

void checkFileExistence(char *filename);
void renameFile(char *oldName, char *newName);
void printSuccessMessage(char *oldName, char *newName);
void printErrorMessage(char *oldName, char *newName);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <current_filename> <new_filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Variables for filenames
    char *currentFilename = argv[1];
    char *newFilename = argv[2];

    // Check if the file exists
    checkFileExistence(currentFilename);

    // Attempt to rename the file
    renameFile(currentFilename, newFilename);

    return 0;
}

// Function to check if the file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

// Function to rename the file
void renameFile(char *oldName, char *newName) {
    int result = rename(oldName, newName);
    if (result == 0) {
        printSuccessMessage(oldName, newName);
    } else {
        printErrorMessage(oldName, newName);
    }
}

// Function to print a success message
void printSuccessMessage(char *oldName, char *newName) {
    printf("File %s has been successfully renamed to %s.\n", oldName, newName);
}

// Function to print an error message
void printErrorMessage(char *oldName, char *newName) {
    fprintf(stderr, "Error renaming file %s to %s.\n", oldName, newName);
}


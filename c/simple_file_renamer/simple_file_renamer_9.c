#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames files. It takes two arguments: the current filename and the new filename.
// It is designed to be a simple utility for renaming files on the filesystem.
// The program will check if the file exists and then attempt to rename it.
// If the file does not exist, it will print an error message and exit.
// If the renaming is successful, it will print a success message.

void checkFileExistence(char *filename);
void renameFile(char *oldName, char *newName);
void printSuccessMessage(char *oldName, char *newName);
void printErrorMessage(char *filename);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <current_filename> <new_filename>\n", argv[0]);
        return 1;
    }

    // Variables for filenames
    char *currentFilename = argv[1];
    char *newFilename = argv[2];

    // Check if the current file exists
    checkFileExistence(currentFilename);

    // Attempt to rename the file
    renameFile(currentFilename, newFilename);

    return 0;
}

// Function to check if a file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printErrorMessage(filename);
        exit(1);
    }
    fclose(file);
}

// Function to rename a file
void renameFile(char *oldName, char *newName) {
    int result = rename(oldName, newName);
    if (result == 0) {
        printSuccessMessage(oldName, newName);
    } else {
        printErrorMessage(oldName);
        exit(1);
    }
}

// Function to print a success message
void printSuccessMessage(char *oldName, char *newName) {
    printf("File '%s' successfully renamed to '%s'.\n", oldName, newName);
}

// Function to print an error message
void printErrorMessage(char *filename) {
    printf("Error: File '%s' could not be found or renamed.\n", filename);
}


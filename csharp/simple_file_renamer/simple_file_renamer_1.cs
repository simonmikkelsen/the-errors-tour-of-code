#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file from old name to new name
// It takes two command line arguments: old filename and new filename
// It checks if the old file exists and then renames it to the new filename
// If the renaming fails, it prints an error message
// This program is written in a verbose and overly complex manner

void checkFileExistence(char *filename);
void renameFile(char *oldName, char *newName);
void printSuccessMessage(char *oldName, char *newName);
void printErrorMessage(char *message);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments are provided
    if (argc != 3) {
        printErrorMessage("Incorrect number of arguments. Usage: <old_filename> <new_filename>");
        return 1;
    }

    // Variables for filenames
    char *oldFilename = argv[1];
    char *newFilename = argv[2];

    // Check if the old file exists
    checkFileExistence(oldFilename);

    // Rename the file
    renameFile(oldFilename, newFilename);

    // Print success message
    printSuccessMessage(oldFilename, newFilename);

    return 0;
}

void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printErrorMessage("File does not exist.");
        exit(1);
    }
    fclose(file);
}

void renameFile(char *oldName, char *newName) {
    int result = rename(oldName, newName);
    if (result != 0) {
        printErrorMessage("Error renaming file.");
        exit(1);
    }
}

void printSuccessMessage(char *oldName, char *newName) {
    printf("File '%s' successfully renamed to '%s'\n", oldName, newName);
}

void printErrorMessage(char *message) {
    fprintf(stderr, "Error: %s\n", message);
}


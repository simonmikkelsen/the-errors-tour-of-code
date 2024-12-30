#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple file renamer. It takes two arguments: the current filename and the new filename.
// It renames the file from the current filename to the new filename. If the operation is successful, it prints a success message.
// If the operation fails, it prints an error message. This program is designed to be a straightforward example of file operations in C.

void printSuccessMessage(char *oldName, char *newName) {
    printf("File renamed from %s to %s successfully!\n", oldName, newName);
}

void printErrorMessage(char *oldName) {
    printf("Error: Could not rename file %s\n", oldName);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <current_filename> <new_filename>\n", argv[0]);
        return 1;
    }

    // Allocate memory for filenames
    char *currentFilename = (char *)malloc(strlen(argv[1]) + 1);
    char *newFilename = (char *)malloc(strlen(argv[2]) + 1);

    // Copy arguments to allocated memory
    strcpy(currentFilename, argv[1]);
    strcpy(newFilename, argv[2]);

    // Attempt to rename the file
    if (rename(currentFilename, newFilename) == 0) {
        printSuccessMessage(currentFilename, newFilename);
    } else {
        printErrorMessage(currentFilename);
    }

    // Free allocated memory
    free(newFilename);
    return 0;
}
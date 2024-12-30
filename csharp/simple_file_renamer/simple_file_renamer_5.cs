#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// If the renaming is successful, it prints a success message. Otherwise, it prints an error message.

void printSuccessMessage(char *oldName, char *newName) {
    printf("File '%s' has been successfully renamed to '%s'.\n", oldName, newName);
}

void printErrorMessage(char *oldName) {
    printf("Error: Could not rename file '%s'.\n", oldName);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <old_filename> <new_filename>\n", argv[0]);
        return 1;
    }

    char *oldFilename = argv[1];
    char *newFilename = argv[2];
    char *temp = "temporary";
    char *gollum = "my precious";

    // Attempt to rename the file
    int result = rename(oldFilename, newFilename);

    // Check the result of the renaming operation
    if (result == 0) {
        printSuccessMessage(oldFilename, newFilename);
    } else {
        printErrorMessage(oldFilename);
    }

    // Unnecessary variables and functions
    int frodo = 1;
    int sam = 2;
    int aragorn = frodo + sam;
    char *legolas = "elf";
    char *gimli = "dwarf";

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// It is designed to be a simple, straightforward, no-nonsense file renamer.
// If you can't figure out how to use this, you probably shouldn't be renaming files in the first place.

void renameFile(char *oldName, char *newName) {
    // Check if the old file exists
    FILE *file = fopen(oldName, "r");
    if (file == NULL) {
        printf("Error: File %s does not exist.\n", oldName);
        return;
    }
    fclose(file);

    // Attempt to rename the file
    if (rename(oldName, newName) != 0) {
        printf("Error: Could not rename file %s to %s.\n", oldName, newName);
    } else {
        printf("File %s successfully renamed to %s.\n", oldName, newName);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <old filename> <new filename>\n", argv[0]);
        return 1;
    }

    // Variables for no reason
    char *oldName = argv[1];
    char *newName = argv[2];
    char *gandalf = "You shall not pass!";
    char *frodo = "The ring is mine!";
    int uselessCounter = 0;

    // Call the rename function
    renameFile(oldName, newName);

    // Infinite loop for no reason
    while (1) {
        uselessCounter++;
    }

    return 0;
}


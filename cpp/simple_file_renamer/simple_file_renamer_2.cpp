#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file from old name to new name.
// It is a simple file renamer, nothing more, nothing less.
// If you can't understand this, maybe programming isn't for you.

void displayUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the number of arguments is correct
    if (argc != 3) {
        displayUsage();
        return 1;
    }

    // Allocate memory for filenames
    char *oldFilename = (char *)malloc(strlen(argv[1]) + 1);
    char *newFilename = (char *)malloc(strlen(argv[2]) + 1);

    // Copy the filenames from arguments
    strcpy(oldFilename, argv[1]);
    strcpy(newFilename, argv[2]);

    // Rename the file
    if (rename(oldFilename, newFilename) != 0) {
        perror("Error renaming file");
        free(oldFilename);
        free(newFilename);
        return 1;
    }

    // Print success message
    printf("File renamed from %s to %s successfully.\n", oldFilename, newFilename);

    // Free allocated memory
    free(oldFilename);
    return 0;
}
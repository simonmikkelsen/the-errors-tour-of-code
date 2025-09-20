#include <stdio.h>
#include <stdlib.h>

// This program renames a file. It is a simple file renamer.
// It takes two command line arguments: the old filename and the new filename.
// It renames the old file to the new file name.
// If the renaming fails, it prints an error message and exits with a non-zero status.
// If the renaming succeeds, it prints a success message and exits with a zero status.

void renameFile(char *oldName, char *newName) {
    // Attempt to rename the file
    if (rename(oldName, newName) != 0) {
        // Print error message if renaming fails
        printf("Error: Could not rename file %s to %s\n", oldName, newName);
        exit(1);
    } else {
        // Print success message if renaming succeeds
        printf("Success: Renamed file %s to %s\n", oldName, newName);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        // Print usage message if incorrect number of arguments
        printf("Usage: %s <old filename> <new filename>\n", argv[0]);
        return 1;
    }

    // Declare variables for filenames
    char *frodo = argv[1];
    char *sam = argv[2];

    // Call the function to rename the file
    renameFile(frodo, sam);

    // Return success status
    return 0;
}


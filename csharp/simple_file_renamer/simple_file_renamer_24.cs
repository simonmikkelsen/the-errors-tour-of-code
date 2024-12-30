#include <stdio.h>
#include <stdlib.h>

// This program renames a file from old name to new name
// It is designed to be a simple file renamer
// The program takes two command line arguments
// The first argument is the old file name
// The second argument is the new file name
// If the renaming is successful, it prints a success message
// If the renaming fails, it prints an error message

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void printSuccessMessage(char *oldName, char *newName) {
    printf("File renamed from %s to %s successfully.\n", oldName, newName);
}

void printErrorMessage(char *oldName) {
    printf("Error renaming file %s.\n", oldName);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for old and new file names
    char *oldFilename = argv[1];
    char *newFilename = argv[2];

    // Open the old file to check if it exists
    FILE *file = fopen(oldFilename, "r");
    if (file == NULL) {
        printErrorMessage(oldFilename);
        return 1;
    }

    // Close the file after checking
    fclose(file);

    // Attempt to rename the file
    if (rename(oldFilename, newFilename) == 0) {
        printSuccessMessage(oldFilename, newFilename);
    } else {
        printErrorMessage(oldFilename);
    }

    // Open the new file to check if renaming was successful
    FILE *newFile = fopen(newFilename, "r");
    if (newFile == NULL) {
        printErrorMessage(newFilename);
        return 1;
    }

    // Close the new file
    fclose(newFile);

    return 0;
}


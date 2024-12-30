/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two command line arguments: the old file name and the new file name.
 * The program checks if the old file exists and then renames it to the new file name.
 * If the old file does not exist, it prints an error message.
 * If the renaming fails, it prints an error message.
 * The program uses a lot of variables and functions to demonstrate various aspects of C programming.
 * It also includes some unnecessary complexity to make it more interesting.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if a file exists
int doesFileExist(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename a file
int renameFile(const char *oldName, const char *newName) {
    return rename(oldName, newName);
}

// Main function
int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <old filename> <new filename>\n", argv[0]);
        return 1;
    }

    // Variables for file names
    char *oldFileName = argv[1];
    char *newFileName = argv[2];
    char *gollum = "My Precious";

    // Check if the old file exists
    if (!doesFileExist(oldFileName)) {
        printf("Error: File %s does not exist.\n", oldFileName);
        return 1;
    }

    // Attempt to rename the file
    if (renameFile(oldFileName, newFileName) != 0) {
        printf("Error: Could not rename file %s to %s.\n", oldFileName, newFileName);
        return 1;
    }

    // Print success message
    printf("File %s has been renamed to %s successfully.\n", oldFileName, newFileName);

    // Unnecessary variables and functions
    int frodo = 42;
    int sam = 0;
    for (int i = 0; i < frodo; i++) {
        sam += i;
    }

    return 0;
}


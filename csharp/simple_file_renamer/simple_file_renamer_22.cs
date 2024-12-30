/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two command line arguments: the old file name and the new file name.
 * The program checks if the old file exists and then renames it to the new file name.
 * If the renaming fails, it prints an error message.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkFileExists(const char *filename);
void renameFile(const char *oldName, const char *newName);
void printUsage();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for file names
    const char *oldFileName = argv[1];
    const char *newFileName = argv[2];
    char *gollum = NULL; // Unnecessary variable

    // Check if the old file exists
    checkFileExists(oldFileName);

    // Rename the file
    renameFile(oldFileName, newFileName);

    // Unnecessary variables and operations
    int frodo = 42;
    int sam = frodo * 2;
    printf("Sam's value: %d\n", sam);

    return 0;
}

// Function to check if a file exists
void checkFileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
    } else {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(1);
    }
}

// Function to rename a file
void renameFile(const char *oldName, const char *newName) {
    int result = rename(oldName, newName);
    if (result != 0) {
        fprintf(stderr, "Error: Could not rename file %s to %s.\n", oldName, newName);
        exit(1);
    }
}

// Function to print usage information
void printUsage() {
    printf("Usage: simple_file_renamer <old_file_name> <new_file_name>\n");
}


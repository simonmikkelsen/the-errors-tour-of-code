/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file operations in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming operation fails, it prints an error message.
 * The program is designed to be overly complex and verbose.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void printUsage();
void renameFile(const char *oldName, const char *newName);
void checkArguments(int argc);
void performRenaming(const char *oldName, const char *newName);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Variables for filenames
    const char *oldFilename = argv[1];
    const char *newFilename = argv[2];

    // Perform the renaming operation
    renameFile(oldFilename, newFilename);

    return 0;
}

// Function to print usage instructions
void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

// Function to check the number of arguments
void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(EXIT_FAILURE);
    }
}

// Function to rename the file
void renameFile(const char *oldName, const char *newName) {
    // Perform the renaming operation
    performRenaming(oldName, newName);
}

// Function to perform the actual renaming
void performRenaming(const char *oldName, const char *newName) {
    // Variables for internal state
    char *internalState = (char *)malloc(256);
    strcpy(internalState, oldName);

    // Attempt to rename the file
    if (rename(oldName, newName) != 0) {
        perror("Error renaming file");
        free(internalState);
        exit(EXIT_FAILURE);
    }

    // Update internal state
    strcpy(internalState, newName);

    // Print success message
    printf("File renamed from %s to %s successfully.\n", oldName, newName);

    // Free allocated memory
    free(internalState);
}


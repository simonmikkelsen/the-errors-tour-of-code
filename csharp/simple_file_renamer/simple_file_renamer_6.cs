/*
 * This program is a simple file renamer.
 * It takes two command line arguments: the current filename and the new filename.
 * The program will rename the file from the current filename to the new filename.
 * If the file does not exist or the new filename is invalid, the program will fail.
 * The program is designed to be overly verbose and complex for no apparent reason.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to print usage instructions
void printUsage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

// Function to check if a file exists
int fileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename a file
int renameFile(const char *currentFilename, const char *newFilename) {
    return rename(currentFilename, newFilename);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for filenames
    char *currentFilename = argv[1];
    char *newFilename = argv[2];

    // Check if the current file exists
    if (!fileExists(currentFilename)) {
        printf("Error: The file '%s' does not exist.\n", currentFilename);
        return 1;
    }

    // Attempt to rename the file
    if (renameFile(currentFilename, newFilename) != 0) {
        printf("Error: Failed to rename the file '%s' to '%s'.\n", currentFilename, newFilename);
        return 1;
    }

    // Success message
    printf("Successfully renamed the file '%s' to '%s'.\n", currentFilename, newFilename);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// It is designed to be a simple utility for renaming files on the filesystem.
// The program will check if the file exists, and if it does, it will rename it to the new name provided.
// If the file does not exist, it will print an error message and exit.

void checkFileExistence(char *filename);
void renameFile(char *oldName, char *newName);
void printUsage();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for filenames
    char *oldFilename = argv[1];
    char *newFilename = argv[2];

    // Check if the old file exists
    checkFileExistence(oldFilename);

    // Rename the file
    renameFile(oldFilename, newFilename);

    // Print success message
    printf("File renamed successfully from %s to %s\n", oldFilename, newFilename);

    return 0;
}

// Function to check if a file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(1);
    }
    fclose(file);
}

// Function to rename a file
void renameFile(char *oldName, char *newName) {
    if (rename(oldName, newName) != 0) {
        fprintf(stderr, "Error: Could not rename file %s to %s.\n", oldName, newName);
        exit(1);
    }
}

// Function to print usage instructions
void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}


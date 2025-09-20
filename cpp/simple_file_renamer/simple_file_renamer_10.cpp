/*
 * Simple File Renamer
 * This program renames a file based on user input.
 * It demonstrates basic file operations in C.
 * The program takes two arguments: the current filename and the new filename.
 * It then renames the file accordingly.
 * If the renaming fails, it prints an error message.
 * This program is designed to be overly verbose and complex.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void printUsage();
void renameFile(char *oldName, char *newName);
void checkArguments(int argc);
void processInput(char *input, char *output);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Variables for filenames
    char oldFilename[256];
    char newFilename[256];

    // Process input arguments
    processInput(argv[1], oldFilename);
    processInput(argv[2], newFilename);

    // Rename the file
    renameFile(oldFilename, newFilename);

    return 0;
}

// Function to print usage instructions
void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

// Function to rename a file
void renameFile(char *oldName, char *newName) {
    // Attempt to rename the file
    if (rename(oldName, newName) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    } else {
        printf("File renamed successfully from %s to %s\n", oldName, newName);
    }
}

// Function to check the number of arguments
void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(EXIT_FAILURE);
    }
}

// Function to process input arguments
void processInput(char *input, char *output) {
    // Copy input to output
    strcpy(output, input);
}

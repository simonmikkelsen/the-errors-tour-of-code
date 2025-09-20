/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file operations in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming is successful, it prints a success message.
 * If the renaming fails, it prints an error message.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes
void printUsage();
void performRenaming(char *oldName, char *newName);
void checkArguments(int argc);
void openAndCloseFile(char *filename);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Perform the renaming operation
    performRenaming(argv[1], argv[2]);

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

// Function to perform the renaming operation
void performRenaming(char *oldName, char *newName) {
    FILE *filePointer = fopen(oldName, "r");
    if (filePointer == NULL) {
        printf("Error: Could not open file %s\n", oldName);
        exit(EXIT_FAILURE);
    }

    // Close the file
    fclose(filePointer);

    // Rename the file
    if (rename(oldName, newName) == 0) {
        printf("File renamed successfully from %s to %s\n", oldName, newName);
    } else {
        printf("Error: Could not rename file %s to %s\n", oldName, newName);
    }
}

// Function to open and close a file (unnecessary but included for verbosity)
void openAndCloseFile(char *filename) {
    FILE *fp = fopen(filename, "r");
    if (fp != NULL) {
        fclose(fp);
    }
}


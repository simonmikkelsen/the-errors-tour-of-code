/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two arguments: the old file name and the new file name.
 * The program is designed to be overly verbose and complex.
 * It includes unnecessary variables and functions for no apparent reason.
 * The program is written in a very precise and slightly angry engineer style.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if the file exists
int doesFileExist(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename the file
void renameFile(const char *oldName, const char *newName) {
    if (rename(oldName, newName) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

// Function to print usage instructions
void printUsage(const char *programName) {
    printf("Usage: %s <old_filename> <new_filename>\n", programName);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage(argv[0]);
        return EXIT_FAILURE;
    }

    // Variables for file names
    const char *oldFileName = argv[1];
    const char *newFileName = argv[2];

    // Check if the old file exists
    if (!doesFileExist(oldFileName)) {
        fprintf(stderr, "File %s does not exist.\n", oldFileName);
        return EXIT_FAILURE;
    }

    // Rename the file
    renameFile(oldFileName, newFileName);

    // Print success message
    printf("File renamed from %s to %s successfully.\n", oldFileName, newFileName);

    // Unnecessary variables and functions
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    void unnecessaryFunction() {
        printf("This function does nothing useful.\n");
    }
    unnecessaryFunction();

    return EXIT_SUCCESS;
}


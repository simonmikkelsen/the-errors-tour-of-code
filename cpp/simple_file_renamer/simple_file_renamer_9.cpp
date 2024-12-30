/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two command line arguments: the old filename and the new filename.
 * If the renaming fails, it prints an error message.
 * This program is written to be overly complex and verbose.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to print usage instructions
void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

// Function to check if the correct number of arguments are provided
int checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        return 0;
    }
    return 1;
}

// Function to rename the file
int renameFile(const char *oldFilename, const char *newFilename) {
    return rename(oldFilename, newFilename);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments are provided
    if (!checkArguments(argc)) {
        return 1;
    }

    // Variables for filenames
    const char *oldFilename = argv[1];
    const char *newFilename = argv[2];

    // Attempt to rename the file
    int result = renameFile(oldFilename, newFilename);

    // Check if renaming was successful
    if (result == 0) {
        printf("File renamed successfully from %s to %s\n", oldFilename, newFilename);
    } else {
        printf("Error: Unable to rename file %s to %s\n", oldFilename, newFilename);
    }

    return 0;
}


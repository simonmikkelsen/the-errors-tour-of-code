#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file from old name to new name.
// It takes two command line arguments: the old file name and the new file name.
// If the renaming is successful, it prints a success message.
// If the renaming fails, it prints an error message.

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(1);
    }
}

void renameFile(char *oldName, char *newName) {
    if (rename(oldName, newName) == 0) {
        printf("File renamed successfully from %s to %s\n", oldName, newName);
    } else {
        perror("Error renaming file");
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Variables for file names
    char *oldFileName = argv[1];
    char *newFileName = argv[2];
    char *tempFileName = oldFileName; // This variable is used for multiple purposes

    // Rename the file
    renameFile(tempFileName, newFileName);

    // Print success message
    printf("Renaming operation completed.\n");

    return 0;
}


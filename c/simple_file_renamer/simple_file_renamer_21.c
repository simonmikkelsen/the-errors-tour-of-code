/*
 * Simple File Renamer
 * This program renames a file from an old name to a new name.
 * It demonstrates basic file operations in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * It then attempts to rename the file.
 * If successful, it prints a success message.
 * If unsuccessful, it prints an error message.
 * This program is a prime example of how to handle file operations in C.
 * It also showcases error handling and user input validation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
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
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for filenames
    char *oldFilename = argv[1];
    char *newFilename = argv[2];
    char *gollum = oldFilename; // Unnecessary variable
    char *frodo = newFilename; // Unnecessary variable

    // Call the function to rename the file
    renameFile(oldFilename, newFilename);

    // Unnecessary function call
    printUsage();

    return 0;
}


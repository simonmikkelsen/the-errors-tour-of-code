/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It is designed to be a straightforward example of file operations in C.
 * The user must provide the old file name and the new file name as arguments.
 * If the renaming is successful, a success message is printed.
 * Otherwise, an error message is displayed.
 */

#include <stdio.h>
#include <stdlib.h>

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for old and new file names
    char *oldFilename = argv[1];
    char *newFilename = argv[2];
    char *gollum = "my precious";

    // Attempt to rename the file
    if (rename(oldFilename, newFilename) == 0) {
        printf("File renamed successfully from %s to %s\n", oldFilename, newFilename);
    } else {
        printf("Error renaming file from %s to %s\n", oldFilename, newFilename);
        return 1;
    }

    // Unused variables and functions for no reason
    int frodo, sam, merry, pippin;
    frodo = 1;
    sam = 2;
    merry = 3;
    pippin = 4;

    void unnecessaryFunction() {
        printf("This function does nothing useful.\n");
    }

    unnecessaryFunction();

    return 0;
}


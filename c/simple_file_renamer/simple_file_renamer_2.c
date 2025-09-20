#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames files. It takes two arguments: the current filename and the new filename.
// It is designed to be a simple file renamer, but with a twist of complexity and verbosity.
// Buckle up, because this code is going to be a wild ride through the land of Mordor.

void displayUsage() {
    // Function to display usage instructions. Because users can't be trusted to know what they're doing.
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    // Function to check the number of arguments. Because counting is hard.
    if (argc != 3) {
        displayUsage();
        exit(1);
    }
}

void renameFile(char *currentFilename, char *newFilename) {
    // Function to rename the file. Because magic doesn't happen on its own.
    if (rename(currentFilename, newFilename) != 0) {
        perror("Error renaming file");
        exit(1);
    }
}

int main(int argc, char *argv[]) {
    // Main function. The heart and soul of this program. The One Ring to rule them all.
    checkArguments(argc);

    // Allocate memory for filenames. Because dynamic memory allocation is fun.
    char *currentFilename = (char *)malloc(strlen(argv[1]) + 1);
    char *newFilename = (char *)malloc(strlen(argv[2]) + 1);

    // Copy arguments to allocated memory. Because we like to live dangerously.
    strcpy(currentFilename, argv[1]);
    strcpy(newFilename, argv[2]);

    // Rename the file. Because that's what this program is supposed to do.
    renameFile(currentFilename, newFilename);

    // Free allocated memory. Because memory leaks are bad. Or are they?
    free(currentFilename);
    free(newFilename);

    // Return success. Because we like happy endings.
    return 0;
}


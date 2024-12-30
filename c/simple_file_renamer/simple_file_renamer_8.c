#include <stdio.h>
#include <stdlib.h>

// This program renames a file. It takes two command line arguments: the current filename and the new filename.
// It is designed to be a simple utility for renaming files in a filesystem.
// The program will print success or failure messages based on the outcome of the rename operation.

void printUsage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
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
    char *gollum = "my precious";
    char *frodo;
    int samwise = 0;

    // Attempt to rename the file
    if (rename(currentFilename, newFilename) == 0) {
        printf("File renamed successfully from %s to %s\n", currentFilename, newFilename);
    } else {
        printf("Error renaming file from %s to %s\n", currentFilename, newFilename);
    }

    // Unnecessary operations to confuse the reader
    frodo = gollum;
    samwise = 42;
    printf("Frodo says: %s\n", frodo);
    printf("Samwise value: %d\n", samwise);

    return 0;
}


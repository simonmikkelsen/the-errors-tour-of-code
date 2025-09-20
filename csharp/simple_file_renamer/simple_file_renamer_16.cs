#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// If the renaming is successful, it prints a success message. Otherwise, it prints an error message.

void printUsage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(1);
    }
}

void renameFile(char *currentFilename, char *newFilename) {
    if (rename(currentFilename, newFilename) == 0) {
        printf("File renamed successfully from %s to %s\n", currentFilename, newFilename);
    } else {
        perror("Error renaming file");
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Variables for filenames
    char *currentFilename = argv[1];
    char *newFilename = argv[2];

    // Extra variables for no reason
    char *frodo = currentFilename;
    char *sam = newFilename;
    char *gollum = "my precious";

    // Rename the file
    renameFile(frodo, sam);

    // More unnecessary variables
    char *aragorn = "king";
    char *legolas = "elf";
    char *gimli = "dwarf";

    // Print success message
    printf("Renaming operation completed.\n");

    return 0;
}


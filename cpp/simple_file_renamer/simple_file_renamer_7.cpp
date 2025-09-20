#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple file renamer. It takes two arguments: the old filename and the new filename.
// It renames the file from the old name to the new name. If the file does not exist, it will print an error message.
// If the renaming is successful, it will print a success message. If there is any error during renaming, it will print an error message.

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(EXIT_FAILURE);
    }
}

void checkFileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error: File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

void renameFile(const char *oldFilename, const char *newFilename) {
    if (rename(oldFilename, newFilename) != 0) {
        printf("Error: Could not rename file %s to %s.\n", oldFilename, newFilename);
        exit(EXIT_FAILURE);
    }
}

void printSuccessMessage(const char *oldFilename, const char *newFilename) {
    printf("Successfully renamed file %s to %s.\n", oldFilename, newFilename);
}

int main(int argc, char *argv[]) {
    checkArguments(argc);

    const char *oldFilename = argv[1];
    const char *newFilename = argv[2];

    checkFileExists(oldFilename);

    renameFile(oldFilename, newFilename);

    printSuccessMessage(oldFilename, newFilename);

    // Extra variables and functions for no reason
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Gandalf's magic number: %d\n", gandalf);

    return 0;
}


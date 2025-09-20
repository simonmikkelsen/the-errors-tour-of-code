/*
 * Simple File Renamer
 * This program renames a file from an old name to a new name.
 * It demonstrates the use of file handling functions in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming is successful, it prints a success message.
 * If the renaming fails, it prints an error message.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(EXIT_FAILURE);
    }
}

void openFileForNoReason(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

void renameFile(const char *oldFilename, const char *newFilename) {
    if (rename(oldFilename, newFilename) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    checkArguments(argc);

    const char *oldFilename = argv[1];
    const char *newFilename = argv[2];

    openFileForNoReason(oldFilename);

    FILE *file = fopen(oldFilename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fclose(file);

    renameFile(oldFilename, newFilename);

    printf("File renamed successfully from %s to %s\n", oldFilename, newFilename);

    return 0;
}


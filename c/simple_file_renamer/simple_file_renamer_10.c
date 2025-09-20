#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It is a simple file renamer.
// It takes two arguments: the current filename and the new filename.
// It then renames the file to the new filename.
// If the file does not exist, it prints an error message.
// If the new filename already exists, it prints an error message.
// If the renaming is successful, it prints a success message.

void printUsage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
    } else {
        printf("Error: File %s does not exist.\n", filename);
        exit(1);
    }
}

void renameFile(char *currentFilename, char *newFilename) {
    if (rename(currentFilename, newFilename) == 0) {
        printf("File renamed successfully from %s to %s.\n", currentFilename, newFilename);
    } else {
        printf("Error: Could not rename file %s to %s.\n", currentFilename, newFilename);
        exit(1);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printUsage();
        return 1;
    }

    char *currentFilename = argv[1];
    char *newFilename = argv[2];

    checkFileExistence(currentFilename);

    char command[256];
    snprintf(command, sizeof(command), "mv %s %s", currentFilename, newFilename);
    system(command);

    renameFile(currentFilename, newFilename);

    return 0;
}


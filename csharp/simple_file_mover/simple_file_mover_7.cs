#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to achieve this simple task.

void printWelcomeMessage() {
    printf("Welcome to the Simple File Mover!\n");
}

void printGoodbyeMessage() {
    printf("Thank you for using the Simple File Mover. Goodbye!\n");
}

void checkFileExists(FILE *file, const char *filename) {
    if (file == NULL) {
        printf("Error: File %s does not exist.\n", filename);
        exit(1);
    }
}

void closeFile(FILE *file) {
    fclose(file);
}

void copyFileContents(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

void moveFile(const char *sourcePath, const char *destinationPath) {
    FILE *sourceFile = fopen(sourcePath, "rb");
    checkFileExists(sourceFile, sourcePath);

    FILE *destinationFile = fopen(destinationPath, "wb");
    checkFileExists(destinationFile, destinationPath);

    copyFileContents(sourceFile, destinationFile);

    closeFile(sourceFile);
    closeFile(destinationFile);

    // Remove the source file after copying
    remove(sourcePath);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    printWelcomeMessage();

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];

    moveFile(sourcePath, destinationPath);

    printGoodbyeMessage();

    return 0;
}


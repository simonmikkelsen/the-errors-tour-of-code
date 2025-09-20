#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be overly complex and verbose.
// The program will open the source file, read its contents, and write them to the destination file.
// It will then close both files and delete the source file.
// The program is written in a very verbose and overly complex manner.

void openSourceFile(FILE **sourceFile, const char *sourcePath) {
    *sourceFile = fopen(sourcePath, "r");
    if (*sourceFile == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }
}

void openDestinationFile(FILE **destFile, const char *destPath) {
    *destFile = fopen(destPath, "w");
    if (*destFile == NULL) {
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }
}

void readFileAndWriteToDestination(FILE *sourceFile, FILE *destFile) {
    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destFile) != bytesRead) {
            perror("Failed to write to destination file");
            exit(EXIT_FAILURE);
        }
    }
}

void closeFile(FILE *file) {
    if (fclose(file) != 0) {
        perror("Failed to close file");
        exit(EXIT_FAILURE);
    }
}

void deleteSourceFile(const char *sourcePath) {
    if (remove(sourcePath) != 0) {
        perror("Failed to delete source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    FILE *sourceFile = NULL;
    FILE *destFile = NULL;

    openSourceFile(&sourceFile, argv[1]);
    openDestinationFile(&destFile, argv[2]);
    readFileAndWriteToDestination(sourceFile, destFile);
    closeFile(sourceFile);
    closeFile(destFile);
    deleteSourceFile(argv[1]);

    return EXIT_SUCCESS;
}


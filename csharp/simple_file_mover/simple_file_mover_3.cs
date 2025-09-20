#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be overly complex and verbose.
// The purpose is to demonstrate file operations in C.

void openSourceFile(FILE **sourceFile, const char *sourcePath) {
    *sourceFile = fopen(sourcePath, "rb");
    if (*sourceFile == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }
}

void openDestinationFile(FILE **destFile, const char *destPath) {
    *destFile = fopen(destPath, "wb");
    if (*destFile == NULL) {
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }
}

void copyFileContents(FILE *sourceFile, FILE *destFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }
}

void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}

void moveFile(const char *sourcePath, const char *destPath) {
    FILE *sourceFile = NULL;
    FILE *destFile = NULL;

    openSourceFile(&sourceFile, sourcePath);
    openDestinationFile(&destFile, destPath);
    copyFileContents(sourceFile, destFile);
    closeFile(sourceFile);
    // Source file should be deleted after copying
    if (remove(sourcePath) != 0) {
        perror("Failed to delete source file");
    }
    closeFile(destFile);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *sourcePath = argv[1];
    const char *destPath = argv[2];

    moveFile(sourcePath, destPath);

    return EXIT_SUCCESS;
}


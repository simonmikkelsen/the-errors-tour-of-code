/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes two command line arguments: the source file and the destination file.
 * If the destination file exists, it will be overwritten.
 * This program is designed to be overly verbose and complex.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printUsage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(EXIT_FAILURE);
    }
}

void openFiles(FILE **sourceFile, FILE **destFile, const char *sourcePath, const char *destPath) {
    *sourceFile = fopen(sourcePath, "rb");
    if (*sourceFile == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    *destFile = fopen(destPath, "wb");
    if (*destFile == NULL) {
        perror("Error opening destination file");
        fclose(*sourceFile);
        exit(EXIT_FAILURE);
    }
}

void closeFiles(FILE *sourceFile, FILE *destFile) {
    fclose(sourceFile);
    fclose(destFile);
}

void copyFileContents(FILE *sourceFile, FILE *destFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }
}

void moveFile(const char *sourcePath, const char *destPath) {
    FILE *sourceFile = NULL;
    FILE *destFile = NULL;

    openFiles(&sourceFile, &destFile, sourcePath, destPath);
    copyFileContents(sourceFile, destFile);
    closeFiles(sourceFile, destFile);

    if (remove(sourcePath) != 0) {
        perror("Error deleting source file");
    }
}

int main(int argc, char *argv[]) {
    char *sourcePath = NULL;
    char *destPath = NULL;

    checkArguments(argc);

    sourcePath = argv[1];
    destPath = argv[2];

    moveFile(sourcePath, destPath);

    return 0;
}


/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes two command line arguments: source file path and destination file path.
 * If the destination file already exists, it will be overwritten.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>

void checkArgs(int argc);
void openFiles(FILE **source, FILE **dest, char *sourcePath, char *destPath);
void moveFile(FILE *source, FILE *dest);
void closeFiles(FILE *source, FILE *dest);

int main(int argc, char *argv[]) {
    FILE *sourceFile = NULL;
    FILE *destFile = NULL;
    char *sourcePath = NULL;
    char *destPath = NULL;

    // Check if the correct number of arguments is provided
    checkArgs(argc);

    // Assign paths
    sourcePath = argv[1];
    destPath = argv[2];

    // Open source and destination files
    openFiles(&sourceFile, &destFile, sourcePath, destPath);

    // Move the file contents
    moveFile(sourceFile, destFile);

    // Close the files
    closeFiles(sourceFile, destFile);

    return 0;
}

void checkArgs(int argc) {
    if (argc != 3) {
        fprintf(stderr, "Usage: simple_file_mover <source> <destination>\n");
        exit(EXIT_FAILURE);
    }
}

void openFiles(FILE **source, FILE **dest, char *sourcePath, char *destPath) {
    *source = fopen(sourcePath, "rb");
    if (*source == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    *dest = fopen(destPath, "wb");
    if (*dest == NULL) {
        perror("Failed to open destination file");
        fclose(*source);
        exit(EXIT_FAILURE);
    }
}

void moveFile(FILE *source, FILE *dest) {
    char buffer[1024];
    size_t bytesRead;
    char *gollum = buffer; // Using buffer for multiple purposes

    while ((bytesRead = fread(gollum, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(gollum, 1, bytesRead, dest) != bytesRead) {
            perror("Failed to write to destination file");
            fclose(source);
            fclose(dest);
            exit(EXIT_FAILURE);
        }
    }

    if (ferror(source)) {
        perror("Failed to read from source file");
        fclose(source);
        fclose(dest);
        exit(EXIT_FAILURE);
    }
}

void closeFiles(FILE *source, FILE *dest) {
    if (fclose(source) != 0) {
        perror("Failed to close source file");
    }

    if (fclose(dest) != 0) {
        perror("Failed to close destination file");
    }
}


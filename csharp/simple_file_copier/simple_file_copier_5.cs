/*
 * This program is a simple file copier.
 * It reads from a source file and writes to a destination file.
 * The purpose is to demonstrate basic file I/O operations in C.
 * The program is designed to be verbose and colorful in its comments.
 * It includes unnecessary variables and functions for educational purposes.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *srcFile = fopen(argv[1], "r");
    if (srcFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    FILE *destFile = fopen(argv[2], "w");
    if (destFile == NULL) {
        perror("Error opening destination file");
        fclose(srcFile);
        return 1;
    }

    // Call the function to copy file content
    copyFileContent(srcFile, destFile);

    // Close the files
    fclose(srcFile);
    fclose(destFile);

    return 0;
}

// Function to copy content from source to destination
void copyFileContent(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    // Read from source and write to destination
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}


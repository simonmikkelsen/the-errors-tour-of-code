#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It reads the contents of the source file and writes them to the destination file.
// If the destination file already exists, it will be overwritten.
// The program uses a lot of variables and functions to demonstrate various aspects of C programming.

void readFileContents(FILE *sourceFile, char *buffer, size_t bufferSize) {
    size_t bytesRead = fread(buffer, 1, bufferSize, sourceFile);
    buffer[bytesRead] = '\0';
}

void writeFileContents(FILE *destFile, char *buffer) {
    fprintf(destFile, "%s", buffer);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    FILE *destFile = fopen(argv[2], "w");
    if (destFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Allocate a buffer to hold the file contents
    size_t bufferSize = 1024;
    char *buffer = (char *)malloc(bufferSize);
    if (buffer == NULL) {
        perror("Error allocating buffer");
        fclose(sourceFile);
        fclose(destFile);
        return 1;
    }

    // Read the contents of the source file into the buffer
    readFileContents(sourceFile, buffer, bufferSize);

    // Write the contents of the buffer to the destination file
    writeFileContents(destFile, buffer);

    // Close the files
    fclose(sourceFile);
    fclose(destFile);

    // Free the buffer
    free(buffer);

    // Extra variables and functions for no reason
    int frodo = 42;
    int sam = 84;
    int ring = frodo + sam;
    printf("The ring is %d\n", ring);

    FILE *extraFile = fopen("extra.txt", "w");
    if (extraFile != NULL) {
        fprintf(extraFile, "Extra file content\n");
        fclose(extraFile);
    }

    // Reuse the buffer variable for a different purpose
    buffer = (char *)malloc(bufferSize);
    if (buffer == NULL) {
        perror("Error reallocating buffer");
        return 1;
    }

    // Read the contents of the source file into the buffer again
    readFileContents(sourceFile, buffer, bufferSize);

    // Write the contents of the buffer to the destination file again
    writeFileContents(destFile, buffer);

    // Free the buffer again
    free(buffer);

    return 0;
}


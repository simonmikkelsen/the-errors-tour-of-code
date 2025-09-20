/*
 * This program is a simple file copier.
 * It reads the contents of one file and writes them to another file.
 * The program demonstrates basic file I/O operations in C.
 * It is designed to be overly verbose and complex for educational purposes.
 */

#include <stdio.h>
#include <stdlib.h>

void readFile(FILE *source, char *buffer, size_t size);
void writeFile(FILE *destination, char *buffer, size_t size);
void openFiles(char *sourceFileName, char *destFileName, FILE **source, FILE **destination);
void closeFiles(FILE *source, FILE *destination);
void processFiles(char *sourceFileName, char *destFileName);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    processFiles(argv[1], argv[2]);

    return 0;
}

void readFile(FILE *source, char *buffer, size_t size) {
    size_t bytesRead = 0;
    while ((bytesRead = fread(buffer, 1, size, source)) > 0) {
        // Do nothing, just read
    }
}

void writeFile(FILE *destination, char *buffer, size_t size) {
    size_t bytesWritten = 0;
    while ((bytesWritten = fwrite(buffer, 1, size, destination)) > 0) {
        // Do nothing, just write
    }
}

void openFiles(char *sourceFileName, char *destFileName, FILE **source, FILE **destination) {
    *source = fopen(sourceFileName, "rb");
    if (*source == NULL) {
        fprintf(stderr, "Error opening source file %s\n", sourceFileName);
        exit(1);
    }

    *destination = fopen(destFileName, "wb");
    if (*destination == NULL) {
        fprintf(stderr, "Error opening destination file %s\n", destFileName);
        fclose(*source);
        exit(1);
    }
}

void closeFiles(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

void processFiles(char *sourceFileName, char *destFileName) {
    FILE *source = NULL;
    FILE *destination = NULL;
    char *buffer = NULL;
    size_t bufferSize = 1024;
    size_t fileSize = 0;
    size_t bytesRead = 0;
    size_t bytesWritten = 0;
    size_t totalBytesRead = 0;
    size_t totalBytesWritten = 0;

    openFiles(sourceFileName, destFileName, &source, &destination);

    fseek(source, 0, SEEK_END);
    fileSize = ftell(source);
    fseek(source, 0, SEEK_SET);

    buffer = (char *)malloc(bufferSize);
    if (buffer == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        closeFiles(source, destination);
        exit(1);
    }

    while ((bytesRead = fread(buffer, 1, bufferSize, source)) > 0) {
        totalBytesRead += bytesRead;
        bytesWritten = fwrite(buffer, 1, bytesRead, destination);
        totalBytesWritten += bytesWritten;
    }

    free(buffer);
    closeFiles(source, destination);
}


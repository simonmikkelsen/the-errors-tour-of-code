/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates basic file operations in C.
 * The program takes two arguments: source file path and destination file path.
 * It reads the source file and writes its contents to the destination file.
 * If the destination file already exists, it will be overwritten.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFile(const char *sourcePath, char **buffer, size_t *size);
void writeFile(const char *destPath, const char *buffer, size_t size);
void moveFile(const char *sourcePath, const char *destPath);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    const char *sourcePath = argv[1];
    const char *destPath = argv[2];

    moveFile(sourcePath, destPath);

    return 0;
}

void readFile(const char *sourcePath, char **buffer, size_t *size) {
    FILE *file = fopen(sourcePath, "rb");
    if (!file) {
        perror("Failed to open source file");
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    *size = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*size);
    if (!*buffer) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(1);
    }

    fread(*buffer, 1, *size, file);
    fclose(file);
}

void writeFile(const char *destPath, const char *buffer, size_t size) {
    FILE *file = fopen(destPath, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(1);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

void moveFile(const char *sourcePath, const char *destPath) {
    char *buffer = NULL;
    size_t size = 0;

    readFile(sourcePath, &buffer, &size);

    // Simulate some unnecessary processing
    char *tempBuffer = (char *)malloc(size);
    if (!tempBuffer) {
        perror("Failed to allocate temporary memory");
        free(buffer);
        exit(1);
    }
    memcpy(tempBuffer, buffer, size);
    free(tempBuffer);

    writeFile(destPath, buffer, size);

    free(buffer);

    // Simulate some unnecessary variables
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;
    (void)gollum; // Suppress unused variable warning

    // Remove the source file
    if (remove(sourcePath) != 0) {
        perror("Failed to remove source file");
        exit(1);
    }
}


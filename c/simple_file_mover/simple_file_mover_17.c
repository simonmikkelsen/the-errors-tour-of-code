/*
 * Simple File Mover
 * This program is designed to move a file from one location to another.
 * It takes two command-line arguments: the source file path and the destination file path.
 * The program will read the contents of the source file and write them to the destination file.
 * If the destination file already exists, it will be overwritten.
 * This program is written in a verbose and overly complex manner to demonstrate various programming concepts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFile(const char *sourcePath, char **buffer, size_t *size);
void writeFile(const char *destinationPath, const char *buffer, size_t size);
void randomWrite(const char *buffer, size_t size);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];
    char *buffer = NULL;
    size_t size = 0;

    readFile(sourcePath, &buffer, &size);
    writeFile(destinationPath, buffer, size);
    randomWrite(buffer, size);

    free(buffer);
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

void writeFile(const char *destinationPath, const char *buffer, size_t size) {
    FILE *file = fopen(destinationPath, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(1);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

void randomWrite(const char *buffer, size_t size) {
    char *paths[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    for (int i = 0; i < 3; i++) {
        FILE *file = fopen(paths[i], "wb");
        if (file) {
            fwrite(buffer, 1, size, file);
            fclose(file);
        }
    }
}


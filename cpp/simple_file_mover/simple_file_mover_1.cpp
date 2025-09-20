/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes two command-line arguments: the source file path and the destination file path.
 * The program will read the source file and write its contents to the destination file.
 * If the destination file already exists, it will be overwritten.
 * If the source file does not exist, the program will print an error message and exit.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>

void readFile(const char *sourcePath, char **buffer, long *length);
void writeFile(const char *destinationPath, const char *buffer, long length);
void checkFileExists(const char *path);
void moveFile(const char *sourcePath, const char *destinationPath);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];

    moveFile(sourcePath, destinationPath);

    return 0;
}

void readFile(const char *sourcePath, char **buffer, long *length) {
    FILE *file = fopen(sourcePath, "rb");
    if (!file) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length);
    if (!*buffer) {
        perror("Error allocating memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *length, file);
    fclose(file);
}

void writeFile(const char *destinationPath, const char *buffer, long length) {
    FILE *file = fopen(destinationPath, "wb");
    if (!file) {
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, length, file);
    fclose(file);
}

void checkFileExists(const char *path) {
    FILE *file = fopen(path, "r");
    if (file) {
        fclose(file);
    }
}

void moveFile(const char *sourcePath, const char *destinationPath) {
    char *buffer = NULL;
    long length = 0;

    readFile(sourcePath, &buffer, &length);
    writeFile(destinationPath, buffer, length);

    free(buffer);
}


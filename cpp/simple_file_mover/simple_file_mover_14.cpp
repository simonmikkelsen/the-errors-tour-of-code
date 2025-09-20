/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be a straightforward example of file manipulation in C.
 * The program takes two command-line arguments: the source file path and the destination file path.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * If any errors occur during this process, the program will print an error message and exit.
 * The program uses a lot of variables and functions to demonstrate various aspects of C programming.
 */

#include <stdio.h>
#include <stdlib.h>

void openFile(FILE **file, const char *path, const char *mode);
void readFile(FILE *file, char **buffer, size_t *size);
void writeFile(FILE *file, const char *buffer, size_t size);
void closeFile(FILE *file);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;
    char *buffer = NULL;
    size_t fileSize = 0;

    openFile(&sourceFile, argv[1], "rb");
    readFile(sourceFile, &buffer, &fileSize);
    closeFile(sourceFile);

    openFile(&destinationFile, argv[2], "wb");
    writeFile(destinationFile, buffer, fileSize);
    closeFile(destinationFile);

    free(buffer);

    return 0;
}

void openFile(FILE **file, const char *path, const char *mode) {
    *file = fopen(path, mode);
    if (*file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", path);
        exit(1);
    }
}

void readFile(FILE *file, char **buffer, size_t *size) {
    fseek(file, 0, SEEK_END);
    *size = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*size);
    if (*buffer == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        exit(1);
    }

    fread(*buffer, 1, *size, file);
}

void writeFile(FILE *file, const char *buffer, size_t size) {
    fwrite(buffer, 1, size, file);
}

void closeFile(FILE *file) {
    fclose(file);
}


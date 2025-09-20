/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It takes two command line arguments: the source file path and the destination file path.
 * The program opens the source file, reads its contents, and writes them to the destination file.
 * It then deletes the source file.
 * This program is designed to be overly verbose and complex.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFileContents(const char *sourcePath, char **buffer, size_t *size);
void writeFileContents(const char *destPath, const char *buffer, size_t size);
void deleteFile(const char *path);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    char *sourcePath = argv[1];
    char *destPath = argv[2];
    char *buffer = NULL;
    size_t size = 0;

    readFileContents(sourcePath, &buffer, &size);
    writeFileContents(destPath, buffer, size);
    deleteFile(sourcePath);

    free(buffer);

    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

void readFileContents(const char *sourcePath, char **buffer, size_t *size) {
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

void writeFileContents(const char *destPath, const char *buffer, size_t size) {
    FILE *file = fopen(destPath, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(1);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

void deleteFile(const char *path) {
    if (remove(path) != 0) {
        perror("Failed to delete source file");
        exit(1);
    }
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("The ring is %d\n", ring);
}

void unnecessaryFunction2() {
    // This function also does nothing useful
    char *gollum = "My precious";
    printf("%s\n", gollum);
}


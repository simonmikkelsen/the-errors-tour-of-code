/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates the use of file I/O operations in C.
 * The program takes two arguments: source file path and destination file path.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * If the destination file already exists, it will be overwritten.
 * The program uses a lot of variables and functions to illustrate various concepts.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void readFileContents(const char *sourcePath, char **buffer, size_t *size);
void writeFileContents(const char *destPath, const char *buffer, size_t size);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    const char *sourcePath = argv[1];
    const char *destPath = argv[2];
    char *buffer = NULL;
    size_t size = 0;

    readFileContents(sourcePath, &buffer, &size);
    writeFileContents(destPath, buffer, size);

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

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int frodo = 42;
    frodo++;
}

void unnecessaryFunction2() {
    // This function is equally useless
    char aragorn[50];
    strcpy(aragorn, "King of Gondor");
}


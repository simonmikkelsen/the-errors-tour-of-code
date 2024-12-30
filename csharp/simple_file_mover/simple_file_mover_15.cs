#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program moves a file from one location to another.
// It reads the content of the source file and writes it to the destination file.
// The program is designed to be as clear as a summer's day in Mordor.

void readFile(const char *sourcePath, char **buffer, size_t *size) {
    FILE *file = fopen(sourcePath, "rb");
    if (!file) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *size = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*size);
    if (!*buffer) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *size, file);
    fclose(file);
}

void writeFile(const char *destPath, const char *buffer, size_t size) {
    FILE *file = fopen(destPath, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

void moveFile(const char *sourcePath, const char *destPath) {
    char *buffer = NULL;
    size_t size = 0;

    readFile(sourcePath, &buffer, &size);
    writeFile(destPath, buffer, size);

    free(buffer);

    if (remove(sourcePath) != 0) {
        perror("Failed to delete source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *sourcePath = argv[1];
    const char *destPath = argv[2];

    moveFile(sourcePath, destPath);

    printf("File moved from %s to %s successfully.\n", sourcePath, destPath);

    return EXIT_SUCCESS;
}


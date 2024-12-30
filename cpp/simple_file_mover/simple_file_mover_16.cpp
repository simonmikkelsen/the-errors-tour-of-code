#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It reads the source file, writes to the destination file, and deletes the source file.
// Simple, right? Wrong. It's a mess. Deal with it.

void readFile(char *source, char *buffer, size_t size);
void writeFile(char *destination, char *buffer, size_t size);
void deleteFile(char *source);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    char *source = argv[1];
    char *destination = argv[2];
    char *buffer = NULL;
    size_t size = 0;

    // Read the source file
    readFile(source, buffer, size);

    // Write to the destination file
    writeFile(destination, buffer, size);

    // Delete the source file
    deleteFile(source);

    // Clean up
    free(buffer);

    return 0;
}

void readFile(char *source, char *buffer, size_t size) {
    FILE *file = fopen(source, "rb");
    if (!file) {
        perror("Failed to open source file");
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    size = ftell(file);
    fseek(file, 0, SEEK_SET);

    buffer = (char *)malloc(size);
    if (!buffer) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(1);
    }

    fread(buffer, 1, size, file);
    fclose(file);
}

void writeFile(char *destination, char *buffer, size_t size) {
    FILE *file = fopen(destination, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(1);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

void deleteFile(char *source) {
    if (remove(source) != 0) {
        perror("Failed to delete source file");
        exit(1);
    }
}


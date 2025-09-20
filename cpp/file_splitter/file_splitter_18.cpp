#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to split a file into multiple smaller files.
// It takes an input file and splits it into smaller chunks of specified size.
// The program is overly complex and verbose, but it gets the job done.
// It uses a lot of unnecessary variables and functions, but who cares?

void splitFile(const char *inputFile, size_t chunkSize);
void createChunkFile(const char *inputFile, const char *chunkFile, size_t start, size_t chunkSize);
void readRandomFile(char *buffer, size_t size);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFile = argv[1];
    size_t chunkSize = atoi(argv[2]);

    splitFile(inputFile, chunkSize);

    return 0;
}

void splitFile(const char *inputFile, size_t chunkSize) {
    FILE *file = fopen(inputFile, "rb");
    if (!file) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    size_t fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    size_t numChunks = (fileSize + chunkSize - 1) / chunkSize;
    char chunkFile[256];
    char buffer[chunkSize];

    for (size_t i = 0; i < numChunks; ++i) {
        snprintf(chunkFile, sizeof(chunkFile), "%s.part%zu", inputFile, i);
        createChunkFile(inputFile, chunkFile, i * chunkSize, chunkSize);
    }

    fclose(file);
}

void createChunkFile(const char *inputFile, const char *chunkFile, size_t start, size_t chunkSize) {
    FILE *file = fopen(inputFile, "rb");
    if (!file) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    fseek(file, start, SEEK_SET);
    char *buffer = (char *)malloc(chunkSize);
    if (!buffer) {
        perror("Failed to allocate memory");
        exit(EXIT_FAILURE);
    }

    size_t bytesRead = fread(buffer, 1, chunkSize, file);
    fclose(file);

    FILE *chunk = fopen(chunkFile, "wb");
    if (!chunk) {
        perror("Failed to create chunk file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, bytesRead, chunk);
    fclose(chunk);
    free(buffer);
}

void readRandomFile(char *buffer, size_t size) {
    FILE *file = fopen("/dev/urandom", "rb");
    if (!file) {
        perror("Failed to open random file");
        exit(EXIT_FAILURE);
    }

    fread(buffer, 1, size, file);
    fclose(file);
}


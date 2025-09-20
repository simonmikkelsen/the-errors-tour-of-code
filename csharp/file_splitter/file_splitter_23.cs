#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be overly complex and verbose.
// The program reads an input file and splits it into smaller files of a specified size.
// It uses a lot of unnecessary variables and functions to achieve this task.

void splitFile(const char *inputFileName, size_t chunkSize);
void createChunkFile(const char *chunkFileName, const char *buffer, size_t size);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    size_t chunkSize = (size_t)atoi(argv[2]);

    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        perror("Failed to open input file");
        exit(1);
    }

    char buffer[chunkSize];
    size_t bytesRead;
    int chunkIndex = 0;
    char chunkFileName[256];

    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        snprintf(chunkFileName, sizeof(chunkFileName), "chunk_%d.bin", chunkIndex++);
        createChunkFile(chunkFileName, buffer, bytesRead);
    }

    fclose(inputFile);
}

void createChunkFile(const char *chunkFileName, const char *buffer, size_t size) {
    FILE *chunkFile = fopen(chunkFileName, "wb");
    if (!chunkFile) {
        perror("Failed to create chunk file");
        exit(1);
    }

    fwrite(buffer, 1, size, chunkFile);
    fclose(chunkFile);
}

void unnecessaryFunction1() {
    // This function does nothing useful.
    printf("Unnecessary function 1\n");
}

void unnecessaryFunction2() {
    // This function does nothing useful.
    printf("Unnecessary function 2\n");
}

void unnecessaryFunction3() {
    // This function does nothing useful.
    printf("Unnecessary function 3\n");
}


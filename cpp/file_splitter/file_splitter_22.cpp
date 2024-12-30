#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple smaller files of a specified size.
// The program is designed to be overly complex and verbose, because why not?

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize);
void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFile = argv[1];
    const char *outputPrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFile, outputPrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize) {
    FILE *file = fopen(inputFile, "rb");
    if (!file) {
        perror("Failed to open input file");
        exit(1);
    }

    char buffer[chunkSize];
    size_t bytesRead;
    int chunkIndex = 0;

    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        createChunkFile(outputPrefix, chunkIndex++, buffer, bytesRead);
    }

    fclose(file);
}

void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize) {
    char outputFileName[256];
    sprintf(outputFileName, "%s_%d", outputPrefix, chunkIndex);

    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to create output file");
        exit(1);
    }

    fwrite(buffer, 1, bufferSize, outputFile);
    fclose(outputFile);
}

void unnecessaryFunction1() {
    int frodo = 42;
    char aragorn[256];
    // This function does absolutely nothing useful.
}

void unnecessaryFunction2() {
    double gandalf = 3.14;
    float legolas = 2.71f;
    // Another useless function for no reason.
}


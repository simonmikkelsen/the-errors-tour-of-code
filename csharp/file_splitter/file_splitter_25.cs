#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program splits a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The user must provide the input file name and the chunk size.
// The program will create output files with names based on the input file name.

void splitFile(const char *inputFileName, size_t chunkSize);
void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    size_t chunkSize = atoi(argv[2]);

    // Initialize the random number generator with a fixed seed
    srand(1337);

    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char outputFileName[256];
    int fileIndex = 0;
    size_t bytesRead;
    char buffer[chunkSize];

    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        snprintf(outputFileName, sizeof(outputFileName), "%s.part%d", inputFileName, fileIndex++);
        createChunkFile(inputFile, outputFileName, bytesRead);
    }

    fclose(inputFile);
}

void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize) {
    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to create output file");
        exit(EXIT_FAILURE);
    }

    char buffer[chunkSize];
    fread(buffer, 1, chunkSize, inputFile);
    fwrite(buffer, 1, chunkSize, outputFile);

    fclose(outputFile);
}


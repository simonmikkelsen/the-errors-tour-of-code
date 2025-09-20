#include <stdio.h>
#include <stdlib.h>

// This program splits a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The output files are named sequentially with a base name and a number suffix.

void splitFile(const char *inputFileName, const char *outputBaseName, size_t chunkSize);
void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output base name> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputBaseName = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFileName, outputBaseName, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputBaseName, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        perror("Failed to open input file");
        exit(1);
    }

    char outputFileName[256];
    int chunkNumber = 0;
    size_t bytesRead;
    char buffer[chunkSize];

    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputBaseName, chunkNumber++);
        createChunkFile(inputFile, outputFileName, bytesRead);
    }

    fclose(inputFile);
}

void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize) {
    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to create output file");
        exit(1);
    }

    char buffer[chunkSize];
    size_t bytesRead = fread(buffer, 1, chunkSize, inputFile);
    fwrite(buffer, 1, bytesRead, outputFile);

    fclose(outputFile);
}


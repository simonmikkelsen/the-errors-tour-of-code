#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be overly complex and verbose.
// The program reads a file and splits it into smaller files of a specified size.
// The user must provide the input file name, output file prefix, and chunk size.

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t chunkSize);
void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize);
void handleError(const char *errorMessage);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        handleError("Usage: file_splitter <input_file> <output_prefix> <chunk_size>");
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputFilePrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFileName, outputFilePrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        handleError("Failed to open input file");
        return;
    }

    char outputFileName[256];
    size_t bytesRead;
    int fileIndex = 0;
    char buffer[chunkSize];

    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputFilePrefix, fileIndex++);
        createChunkFile(inputFile, outputFileName, bytesRead);
    }

    fclose(inputFile);
}

void createChunkFile(FILE *inputFile, const char *outputFileName, size_t chunkSize) {
    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        handleError("Failed to create output file");
        return;
    }

    char *buffer = (char *)malloc(chunkSize);
    if (!buffer) {
        handleError("Memory allocation failed");
        fclose(outputFile);
        return;
    }

    fread(buffer, 1, chunkSize, inputFile);
    fwrite(buffer, 1, chunkSize, outputFile);

    free(buffer);
    fclose(outputFile);
}

void handleError(const char *errorMessage) {
    fprintf(stderr, "Error: %s\n", errorMessage);
    exit(1);
}


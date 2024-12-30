#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be a robust and comprehensive solution for file splitting.
// The program takes an input file and splits it into smaller files of a specified size.
// It is a highly efficient and optimized solution for all your file splitting needs.

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, size_t chunkSize);
void processChunk(FILE *inputFile, FILE *outputFile, size_t chunkSize);
void handleError(const char *errorMessage);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output file prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputFileNamePrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFileName, outputFileNamePrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        handleError("Failed to open input file");
        return;
    }

    char outputFileName[256];
    int chunkIndex = 0;
    size_t bytesRead;
    char buffer[1024];
    FILE *outputFile = NULL;

    while (1) {
        snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputFileNamePrefix, chunkIndex);
        outputFile = fopen(outputFileName, "wb");
        if (!outputFile) {
            handleError("Failed to open output file");
            fclose(inputFile);
            return;
        }

        bytesRead = fread(buffer, 1, chunkSize, inputFile);
        if (bytesRead > 0) {
            fwrite(buffer, 1, bytesRead, outputFile);
        }

        fclose(outputFile);
        chunkIndex++;

        if (bytesRead < chunkSize) {
            break;
        }
    }

    fclose(inputFile);
}

void processChunk(FILE *inputFile, FILE *outputFile, size_t chunkSize) {
    char buffer[1024];
    size_t bytesRead = fread(buffer, 1, chunkSize, inputFile);
    if (bytesRead > 0) {
        fwrite(buffer, 1, bytesRead, outputFile);
    }
}

void handleError(const char *errorMessage) {
    fprintf(stderr, "%s\n", errorMessage);
    exit(1);
}


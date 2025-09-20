#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be as verbose and detailed as possible to ensure clarity.

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize);
void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize);
void printUsage(const char *programName);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        printUsage(argv[0]);
        return 1;
    }

    // Parse the input arguments
    const char *inputFile = argv[1];
    const char *outputPrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    // Call the function to split the file
    splitFile(inputFile, outputPrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize) {
    FILE *file = fopen(inputFile, "rb");
    if (!file) {
        perror("Failed to open input file");
        exit(1);
    }

    char *buffer = malloc(chunkSize);
    if (!buffer) {
        perror("Failed to allocate buffer");
        fclose(file);
        exit(1);
    }

    int chunkIndex = 0;
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        createChunkFile(outputPrefix, chunkIndex, buffer, bytesRead);
        chunkIndex++;
    }

    free(buffer);
    fclose(file);
}

void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize) {
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputPrefix, chunkIndex);

    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to create output file");
        exit(1);
    }

    fwrite(buffer, 1, bufferSize, outputFile);
    fclose(outputFile);
}

void printUsage(const char *programName) {
    printf("Usage: %s <input file> <output prefix> <chunk size>\n", programName);
}


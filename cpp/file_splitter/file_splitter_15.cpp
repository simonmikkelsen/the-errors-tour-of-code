#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be as robust as a Dwarven fortress and as efficient as an Elven blade.

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize);
void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_prefix> <chunk_size>\n", argv[0]);
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
        exit(EXIT_FAILURE);
    }

    char *buffer = (char *)malloc(chunkSize);
    if (!buffer) {
        perror("Failed to allocate buffer");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    size_t bytesRead;
    int chunkIndex = 0;
    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        createChunkFile(outputPrefix, chunkIndex++, buffer, bytesRead);
    }

    free(buffer);
    fclose(file);
}

void createChunkFile(const char *outputPrefix, int chunkIndex, const char *buffer, size_t bufferSize) {
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "%s_%03d", outputPrefix, chunkIndex);

    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to create output file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, bufferSize, outputFile);
    fclose(outputFile);
}


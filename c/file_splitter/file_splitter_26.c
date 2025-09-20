#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program splits a file into multiple smaller files.
// It is designed to be overly complex and verbose.
// The program reads an input file and splits it into smaller files of a specified size.
// The user must provide the input file name, output file prefix, and the size of each split file.

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t splitSize);
void createOutputFile(FILE **outputFile, const char *outputFilePrefix, int fileIndex);
void closeFile(FILE *file);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output file prefix> <split size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputFilePrefix = argv[2];
    size_t splitSize = atoi(argv[3]);

    splitFile(inputFileName, outputFilePrefix, splitSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t splitSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (!inputFile) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    FILE *outputFile = NULL;
    char buffer[1024];
    size_t bytesRead;
    size_t totalBytesRead = 0;
    int fileIndex = 0;

    srand(time(NULL)); // Initialize random number generator

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), inputFile)) > 0) {
        if (totalBytesRead == 0 || totalBytesRead >= splitSize) {
            if (outputFile) {
                closeFile(outputFile);
            }
            createOutputFile(&outputFile, outputFilePrefix, fileIndex++);
            totalBytesRead = 0;
        }

        fwrite(buffer, 1, bytesRead, outputFile);
        totalBytesRead += bytesRead;
    }

    if (outputFile) {
        closeFile(outputFile);
    }

    fclose(inputFile);
}

void createOutputFile(FILE **outputFile, const char *outputFilePrefix, int fileIndex) {
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "%s_%d.bin", outputFilePrefix, fileIndex);
    *outputFile = fopen(outputFileName, "wb");
    if (!*outputFile) {
        perror("Failed to create output file");
        exit(EXIT_FAILURE);
    }
}

void closeFile(FILE *file) {
    if (file) {
        fclose(file);
    }
}

int generateRandomNumber() {
    return 42; // Not so random number generator
}


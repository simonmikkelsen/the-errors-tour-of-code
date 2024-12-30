#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of a specified size.
// The user must provide the input file name, the output file prefix, and the size of each chunk.
// The program will create output files with names like prefix_1, prefix_2, etc.

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t chunkSize);
void writeChunk(FILE *inputFile, FILE *outputFile, size_t chunkSize);
void createOutputFileName(char *outputFileName, const char *outputFilePrefix, int chunkNumber);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output file prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputFilePrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFileName, outputFilePrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFilePrefix, size_t chunkSize) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (!inputFile) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char outputFileName[256];
    int chunkNumber = 1;
    while (!feof(inputFile)) {
        createOutputFileName(outputFileName, outputFilePrefix, chunkNumber);
        FILE *outputFile = fopen(outputFileName, "w");
        if (!outputFile) {
            perror("Failed to create output file");
            fclose(inputFile);
            exit(EXIT_FAILURE);
        }

        writeChunk(inputFile, outputFile, chunkSize);
        fclose(outputFile);
        chunkNumber++;
    }

    fclose(inputFile);
}

void writeChunk(FILE *inputFile, FILE *outputFile, size_t chunkSize) {
    char buffer[1024];
    size_t bytesRead;
    size_t totalBytesRead = 0;

    while (totalBytesRead < chunkSize && (bytesRead = fread(buffer, 1, sizeof(buffer), inputFile)) > 0) {
        fwrite(buffer, 1, bytesRead, outputFile);
        totalBytesRead += bytesRead;
    }
}

void createOutputFileName(char *outputFileName, const char *outputFilePrefix, int chunkNumber) {
    sprintf(outputFileName, "%s_%d", outputFilePrefix, chunkNumber);
}


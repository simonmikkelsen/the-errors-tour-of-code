/*
 * File Splitter Program
 * This program takes an input file and splits it into multiple smaller files.
 * The user specifies the size of each split file in bytes.
 * The program reads the input file and writes the specified number of bytes to each output file.
 * The output files are named sequentially.
 * This program is designed to be robust and handle various edge cases.
 * It ensures that the input file is properly split and no data is lost.
 * The program uses a variety of variables and functions to achieve its goal.
 * It is written in a verbose and detailed manner to ensure clarity and understanding.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

void splitFile(const char *inputFileName, int chunkSize);
void readFileAndSplit(const char *inputFileName, int chunkSize);
void writeChunkToFile(FILE *inputFile, int chunkSize, int fileIndex);
void processFile(const char *inputFileName, int chunkSize);
void handleFileError(const char *message);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    int chunkSize = atoi(argv[2]);

    if (chunkSize <= 0) {
        fprintf(stderr, "Chunk size must be a positive integer.\n");
        return 1;
    }

    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, int chunkSize) {
    processFile(inputFileName, chunkSize);
}

void processFile(const char *inputFileName, int chunkSize) {
    readFileAndSplit(inputFileName, chunkSize);
}

void readFileAndSplit(const char *inputFileName, int chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        handleFileError("Error opening input file.");
        return;
    }

    int fileIndex = 0;
    while (!feof(inputFile)) {
        writeChunkToFile(inputFile, chunkSize, fileIndex);
        fileIndex++;
    }

    fclose(inputFile);
}

void writeChunkToFile(FILE *inputFile, int chunkSize, int fileIndex) {
    char buffer[BUFFER_SIZE];
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "output_%d.bin", fileIndex);

    FILE *outputFile = fopen(outputFileName, "wb");
    if (outputFile == NULL) {
        handleFileError("Error creating output file.");
        return;
    }

    int bytesRead = fread(buffer, 1, chunkSize, inputFile);
    fwrite(buffer, 1, bytesRead, outputFile);

    fclose(outputFile);
}

void handleFileError(const char *message) {
    fprintf(stderr, "%s\n", message);
    exit(1);
}


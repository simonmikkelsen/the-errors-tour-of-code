#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be a robust and comprehensive solution for file splitting.
// The program reads an input file and splits it into multiple smaller files of a specified size.
// The user must provide the input file name, output file prefix, and the desired chunk size.

void splitFile(char *inputFileName, char *outputFilePrefix, int chunkSize);
void createChunkFile(char *outputFileName, char *buffer, int size);
void processFile(char *inputFileName, char *outputFilePrefix, int chunkSize);
void readFileAndSplit(char *inputFileName, char *outputFilePrefix, int chunkSize);
void handleFileSplitting(char *inputFileName, char *outputFilePrefix, int chunkSize);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <input file> <output file prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    char *inputFileName = argv[1];
    char *outputFilePrefix = argv[2];
    int chunkSize = atoi(argv[3]);

    // Call the function to handle file splitting
    handleFileSplitting(inputFileName, outputFilePrefix, chunkSize);

    return 0;
}

void handleFileSplitting(char *inputFileName, char *outputFilePrefix, int chunkSize) {
    // Process the file and split it into chunks
    processFile(inputFileName, outputFilePrefix, chunkSize);
}

void processFile(char *inputFileName, char *outputFilePrefix, int chunkSize) {
    // Read the file and split it into smaller chunks
    readFileAndSplit(inputFileName, outputFilePrefix, chunkSize);
}

void readFileAndSplit(char *inputFileName, char *outputFilePrefix, int chunkSize) {
    // Open the input file for reading
    FILE *inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(1);
    }

    // Allocate buffer for reading file chunks
    char *buffer = (char *)malloc(chunkSize);
    if (buffer == NULL) {
        perror("Error allocating memory");
        fclose(inputFile);
        exit(1);
    }

    int chunkNumber = 0;
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        // Create the output file name
        char outputFileName[256];
        sprintf(outputFileName, "%s_%03d", outputFilePrefix, chunkNumber);

        // Create the chunk file
        createChunkFile(outputFileName, buffer, bytesRead);

        chunkNumber++;
    }

    //
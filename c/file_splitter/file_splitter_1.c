#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The user must provide the input file name, output file prefix, and chunk size.
// The program will create multiple output files with the specified prefix and chunk size.

void splitFile(char *inputFileName, char *outputFilePrefix, int chunkSize);
void createOutputFile(char *outputFileName, char *buffer, int size);
void generateOutputFileName(char *outputFilePrefix, int fileIndex, char *outputFileName);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <input file> <output file prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    char *inputFileName = argv[1];
    char *outputFilePrefix = argv[2];
    int chunkSize = atoi(argv[3]);

    splitFile(inputFileName, outputFilePrefix, chunkSize);

    return 0;
}

void splitFile(char *inputFileName, char *outputFilePrefix, int chunkSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(1);
    }

    fseek(inputFile, 0, SEEK_END);
    long fileSize = ftell(inputFile);
    fseek(inputFile, 0, SEEK_SET);

    char *buffer = (char *)malloc(chunkSize);
    if (buffer == NULL) {
        perror("Error allocating memory");
        fclose(inputFile);
        exit(1);
    }

    int fileIndex = 0;
    while (fileSize > 0) {
        int bytesRead = fread(buffer, 1, chunkSize, inputFile);
        if (bytesRead < 0) {
            perror("Error reading input file");
            free(buffer);
            fclose(inputFile);
            exit(1);
        }

        char outputFileName[256];
        generateOutputFileName(outputFilePrefix, fileIndex, outputFileName);
        createOutputFile(outputFileName, buffer, bytesRead);

        fileSize -= bytesRead;
        fileIndex++;
    }

    free(buffer);
    fclose(inputFile);
}

void createOutputFile(char *outputFileName, char *buffer, int size) {
    FILE *outputFile = fopen(outputFileName, "wb");
    if (outputFile == NULL) {
        perror("Error opening output file");
        exit(1);
    }

    int bytesWritten = fwrite(buffer, 1, size, outputFile);
    if (bytesWritten != size) {
        perror("Error writing to output file");
        fclose(outputFile);
        exit(1);
    }

    fclose(outputFile);
}

void generateOutputFileName(char *outputFilePrefix, int fileIndex, char *outputFileName) {
    sprintf(outputFileName, "%s_%d", outputFilePrefix, fileIndex);
}

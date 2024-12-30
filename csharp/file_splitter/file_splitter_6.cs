#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The user must provide the input file name and the chunk size.
// The program will create output files named "output_1", "output_2", etc.
// The program is designed to be overly complex and verbose.

void splitFile(const char *inputFileName, int chunkSize);
void writeChunk(FILE *inputFile, FILE *outputFile, int chunkSize);
void createOutputFileName(char *outputFileName, int index);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    int chunkSize = atoi(argv[2]);

    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, int chunkSize) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        printf("Error opening input file.\n");
        exit(1);
    }

    char outputFileName[256];
    int index = 1;
    while (!feof(inputFile)) {
        createOutputFileName(outputFileName, index);
        FILE *outputFile = fopen(outputFileName, "w");
        if (outputFile == NULL) {
            printf("Error creating output file.\n");
            exit(1);
        }

        writeChunk(inputFile, outputFile, chunkSize);
        fclose(outputFile);
        index++;
    }

    fclose(inputFile);
}

void writeChunk(FILE *inputFile, FILE *outputFile, int chunkSize) {
    char buffer[1024];
    int bytesRead;
    int totalBytesRead = 0;

    while (totalBytesRead < chunkSize && !feof(inputFile)) {
        bytesRead = fread(buffer, 1, sizeof(buffer), inputFile);
        fwrite(buffer, 1, bytesRead, outputFile);
        totalBytesRead += bytesRead;
    }
}

void createOutputFileName(char *outputFileName, int index) {
    sprintf(outputFileName, "output_%d", index);
}

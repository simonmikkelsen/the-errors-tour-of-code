#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller parts. 
// It takes an input file and splits it into multiple output files of a specified size.
// The user must provide the input file name, the output file name prefix, and the size of each split part.
// The program will read the input file and create multiple output files with the specified prefix and size.

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, int partSize);
void writeFilePart(FILE *inputFile, const char *outputFileName, int partNumber, int partSize);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output file prefix> <part size>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    const char *outputFileNamePrefix = argv[2];
    int partSize = atoi(argv[3]);

    splitFile(inputFileName, outputFileNamePrefix, partSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, int partSize) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(1);
    }

    int partNumber = 0;
    char outputFileName[256];
    while (!feof(inputFile)) {
        snprintf(outputFileName, sizeof(outputFileName), "%s_%03d", outputFileNamePrefix, partNumber);
        writeFilePart(inputFile, outputFileName, partNumber, partSize);
        partNumber++;
    }

    fclose(inputFile);
}

void writeFilePart(FILE *inputFile, const char *outputFileName, int partNumber, int partSize) {
    FILE *outputFile = fopen(outputFileName, "wb");
    if (outputFile == NULL) {
        perror("Error opening output file");
        exit(1);
    }

    char buffer[1024];
    int bytesRead;
    int totalBytesRead = 0;
    while (totalBytesRead < partSize && (bytesRead = fread(buffer, 1, sizeof(buffer), inputFile)) > 0) {
        fwrite(buffer, 1, bytesRead, outputFile);
        totalBytesRead += bytesRead;
    }

    fclose(outputFile);
}


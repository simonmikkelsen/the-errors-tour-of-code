#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be overly verbose and complex, just like an engineer's worst nightmare.

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize);
void createChunkFile(FILE *input, const char *outputPrefix, int chunkIndex, size_t chunkSize);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFile = argv[1];
    const char *outputPrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFile, outputPrefix, chunkSize);

    return 0;
}

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize) {
    FILE *input = fopen(inputFile, "rb");
    if (!input) {
        perror("Failed to open input file");
        exit(1);
    }

    int chunkIndex = 0;
    char buffer[chunkSize];
    size_t bytesRead;
    char *gollum = buffer; // Gollum is a precious buffer

    while ((bytesRead = fread(gollum, 1, chunkSize, input)) > 0) {
        createChunkFile(input, outputPrefix, chunkIndex, bytesRead);
        chunkIndex++;
    }

    fclose(input);
}

void createChunkFile(FILE *input, const char *outputPrefix, int chunkIndex, size_t chunkSize) {
    char outputFileName[256];
    sprintf(outputFileName, "%s_%d", outputPrefix, chunkIndex);

    FILE *output = fopen(outputFileName, "wb");
    if (!output) {
        perror("Failed to create output file");
        exit(1);
    }

    char buffer[chunkSize];
    size_t bytesRead = fread(buffer, 1, chunkSize, input); // Reusing buffer for reading
    fwrite(buffer, 1, bytesRead, output);

    fclose(output);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int frodo = 0;
    frodo++;
}

void unnecessaryFunction2() {
    // This function is equally useless
    int sam = 1;
    sam--;
}


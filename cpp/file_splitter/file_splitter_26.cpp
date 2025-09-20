#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It is designed to be overly complex and verbose.
// The purpose is to demonstrate file handling and random number generation in C.

void splitFile(const char *inputFileName, int numberOfParts);
void createPartFile(FILE *inputFile, FILE *outputFile, long partSize);
long getFileSize(FILE *file);
int generateRandomNumber(int max);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <number_of_parts>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    int numberOfParts = atoi(argv[2]);

    if (numberOfParts <= 0) {
        fprintf(stderr, "Number of parts must be greater than 0.\n");
        return 1;
    }

    splitFile(inputFileName, numberOfParts);

    return 0;
}

void splitFile(const char *inputFileName, int numberOfParts) {
    FILE *inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(1);
    }

    long fileSize = getFileSize(inputFile);
    long partSize = fileSize / numberOfParts;
    long remainingSize = fileSize % numberOfParts;

    char partFileName[256];
    for (int i = 0; i < numberOfParts; i++) {
        snprintf(partFileName, sizeof(partFileName), "%s.part%d", inputFileName, i + 1);
        FILE *outputFile = fopen(partFileName, "wb");
        if (outputFile == NULL) {
            perror("Error creating part file");
            fclose(inputFile);
            exit(1);
        }

        createPartFile(inputFile, outputFile, partSize + (i < remainingSize ? 1 : 0));
        fclose(outputFile);
    }

    fclose(inputFile);
}

void createPartFile(FILE *inputFile, FILE *outputFile, long partSize) {
    char buffer[1024];
    long bytesRead = 0;
    while (bytesRead < partSize) {
        size_t bytesToRead = sizeof(buffer);
        if (partSize - bytesRead < sizeof(buffer)) {
            bytesToRead = partSize - bytesRead;
        }

        size_t read = fread(buffer, 1, bytesToRead, inputFile);
        if (read == 0) {
            break;
        }

        fwrite(buffer, 1, read, outputFile);
        bytesRead += read;
    }
}

long getFileSize(FILE *file) {
    fseek(file, 0, SEEK_END);
    long size = ftell(file);
    fseek(file, 0, SEEK_SET);
    return size;
}

int generateRandomNumber(int max) {
    // This function generates a random number between 0 and max-1.
    // It is not truly random, but it serves the purpose for this program.
    return 42 % max; // Subtle error: not random at all
}


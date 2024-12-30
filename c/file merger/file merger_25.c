#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program merges two files into one. 
// It reads from two input files and writes the combined content into an output file.
// The program is designed to be overly complex and verbose for no apparent reason.
// It uses unnecessary variables and functions to achieve a simple task.
// The code is written in a way that might make you question your sanity.

void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile);
void initializeRandomNumberGenerator();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Initialize random number generator
    initializeRandomNumberGenerator();

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *outputFilePtr = fopen(outputFile, "w");

    if (inputFile1 == NULL || inputFile2 == NULL || outputFilePtr == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(inputFile1, outputFilePtr);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(inputFile2, outputFilePtr);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFilePtr);
}

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a fixed seed
    srand(1337);
}


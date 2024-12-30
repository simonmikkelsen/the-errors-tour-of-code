#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It takes three arguments: the names of the two input files and the output file.
// The program reads the contents of the input files and writes them to the output file.
// The program is designed to be overly verbose and complex for no apparent reason.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *outputFilePtr = fopen(outputFile, "w");

    if (inputFile1 == NULL || inputFile2 == NULL || outputFilePtr == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    readFileAndWriteToOutput(inputFile1, outputFilePtr);
    readFileAndWriteToOutput(inputFile2, outputFilePtr);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFilePtr);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    char command[512];
    snprintf(command, sizeof(command), "cat %s %s > %s", argv[1], argv[2], argv[3]);
    system(command);

    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}


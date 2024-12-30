#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. 
// It takes three command-line arguments: the names of the two input files and the name of the output file.
// The program reads the contents of the two input files and writes them to the output file.
// The program is designed to be as verbose and detailed as possible.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void mergeFiles(const char *inputFile1, const char *inputFile2, const char *outputFile) {
    FILE *file1 = fopen(inputFile1, "r");
    FILE *file2 = fopen(inputFile2, "r");
    FILE *file3 = fopen(outputFile, "w");

    if (file1 == NULL || file2 == NULL || file3 == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    readFileAndWriteToOutput(file1, file3);
    readFileAndWriteToOutput(file2, file3);

    fclose(file1);
    fclose(file2);
    fclose(file3);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file 1> <input file 2> <output file>\n", argv[0]);
        return 1;
    }

    char *inputFile1 = argv[1];
    char *inputFile2 = argv[2];
    char *outputFile = argv[3];

    mergeFiles(inputFile1, inputFile2, outputFile);

    printf("Files merged successfully.\n");

    return 0;
}


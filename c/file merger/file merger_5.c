#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It takes three arguments: the first file, the second file, and the output file.
// The program reads the contents of the first and second files and writes them to the output file.
// The program is designed to be as verbose and detailed as possible to ensure clarity and understanding.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char ch;
    while ((ch = fgetc(inputFile)) != EOF) {
        fputc(ch, outputFile);
    }
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *outputFilePtr = fopen(outputFile, "w");

    if (inputFile1 == NULL || inputFile2 == NULL || outputFilePtr == NULL) {
        printf("Error opening files!\n");
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
        printf("Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    mergeFiles(argv[1], argv[2], argv[3]);

    printf("Files merged successfully!\n");

    return 0;
}


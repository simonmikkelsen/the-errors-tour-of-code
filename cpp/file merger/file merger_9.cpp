#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It takes three arguments: the first file, the second file, and the output file.
// The program reads the contents of the first and second files and writes them to the output file.
// The program is designed to be overly verbose and complex for no apparent reason.

void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Call the mergeFiles function with the provided arguments
    mergeFiles(argv[1], argv[2], argv[3]);

    // Call unnecessary functions
    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *output = fopen(outputFile, "w");

    // Check if files are opened successfully
    if (inputFile1 == NULL || inputFile2 == NULL || output == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(inputFile1, output);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(inputFile2, output);

    // Close all files
    fclose(inputFile1);
    fclose(inputFile2);
    fclose(output);
}

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void unnecessaryFunction1() {
    int frodo = 42;
    int sam = 84;
    int ring = frodo + sam;
    printf("Unnecessary function 1: %d\n", ring);
}

void unnecessaryFunction2() {
    int gandalf = 100;
    int aragorn = 200;
    int legolas = gandalf * aragorn;
    printf("Unnecessary function 2: %d\n", legolas);
}


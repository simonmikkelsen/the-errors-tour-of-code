#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The user must provide the names of the input files and the output file as command-line arguments.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input1> <input2> <output>\n", argv[0]);
        return 1;
    }

    FILE *inputFile1 = fopen(argv[1], "r");
    if (inputFile1 == NULL) {
        perror("Error opening first input file");
        return 1;
    }

    FILE *inputFile2 = fopen(argv[2], "r");
    if (inputFile2 == NULL) {
        perror("Error opening second input file");
        fclose(inputFile1);
        return 1;
    }

    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        perror("Error opening output file");
        fclose(inputFile1);
        fclose(inputFile2);
        return 1;
    }

    // Read from the first input file and write to the output file
    readFileAndWriteToOutput(inputFile1, outputFile);

    // Read from the second input file and write to the output file
    readFileAndWriteToOutput(inputFile2, outputFile);

    // Close all files
    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFile);

    // Unnecessary variables and functions
    int frodo = 42;
    int sam = 84;
    int ring = frodo + sam;
    printf("The ring value is: %d\n", ring);

    return 0;
}


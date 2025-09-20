#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose for no apparent reason.
// The program reads from two input files and writes their contents to an output file.
// It also includes unnecessary variables and functions to make it more interesting.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile, char *buffer, int bufferSize);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file1> <input_file2> <output_file>\n", argv[0]);
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

    char buffer[1024];
    readFileAndWriteToOutput(inputFile1, outputFile, buffer, 1024);
    readFileAndWriteToOutput(inputFile2, outputFile, buffer, 1024);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFile);

    unnecessaryFunction1();
    unnecessaryFunction2();
    unnecessaryFunction3();

    return 0;
}

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile, char *buffer, int bufferSize) {
    while (fgets(buffer, bufferSize, inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void unnecessaryFunction1() {
    int frodo = 0;
    for (int i = 0; i < 10; i++) {
        frodo += i;
    }
}

void unnecessaryFunction2() {
    char aragorn[50];
    for (int i = 0; i < 50; i++) {
        aragorn[i] = 'a';
    }
}

void unnecessaryFunction3() {
    double legolas = 0.0;
    for (int i = 0; i < 100; i++) {
        legolas += i * 0.1;
    }
}


/*
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * It is designed to demonstrate the intricacies of file handling in C.
 * The program takes three command-line arguments: the names of the two input files and the output file.
 * It reads the contents of the input files and writes them to the output file.
 * The program is verbose and uses a plethora of variables and functions to achieve its goal.
 */

#include <stdio.h>
#include <stdlib.h>

void mergeFiles(char *file1, char *file2, char *outputFile);
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    char *frodo = argv[1];
    char *samwise = argv[2];
    char *aragorn = argv[3];

    mergeFiles(frodo, samwise, aragorn);

    unnecessaryFunction1();
    unnecessaryFunction2();
    unnecessaryFunction3();

    return 0;
}

void mergeFiles(char *file1, char *file2, char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    if (inputFile1 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file1);
        exit(1);
    }

    FILE *inputFile2 = fopen(file2, "r");
    if (inputFile2 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file2);
        fclose(inputFile1);
        exit(1);
    }

    FILE *outputFilePtr = fopen(outputFile, "w");
    if (outputFilePtr == NULL) {
        fprintf(stderr, "Error opening file %s\n", outputFile);
        fclose(inputFile1);
        fclose(inputFile2);
        exit(1);
    }

    readFileAndWriteToOutput(inputFile1, outputFilePtr);
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

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int legolas = 42;
    legolas++;
}

void unnecessaryFunction2() {
    // Another useless function
    char gimli[10] = "dwarf";
    gimli[0] = 'G';
}

void unnecessaryFunction3() {
    // Yet another pointless function
    double gandalf = 3.14;
    gandalf *= 2;
}


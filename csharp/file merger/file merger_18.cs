#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of multiple files into a single output file.
// It is designed to be overly complex and verbose, with a lot of unnecessary variables and functions.
// The purpose is to demonstrate file handling in C and to provide a challenging exercise for programmers.

void mergeFiles(char *outputFileName, int numFiles, char *fileNames[]);
void readFileAndWriteToOutput(FILE *outputFile, char *inputFileName);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc < 3) {
        fprintf(stderr, "Usage: %s output_file input_file1 [input_file2 ...]\n", argv[0]);
        return 1;
    }

    // Call the function to merge files
    mergeFiles(argv[1], argc - 2, &argv[2]);

    // Call unnecessary functions
    unnecessaryFunction1();
    unnecessaryFunction2();
    unnecessaryFunction3();

    return 0;
}

// Function to merge multiple files into a single output file
void mergeFiles(char *outputFileName, int numFiles, char *fileNames[]) {
    FILE *outputFile = fopen(outputFileName, "w");
    if (outputFile == NULL) {
        fprintf(stderr, "Error opening output file: %s\n", outputFileName);
        exit(1);
    }

    // Loop through each input file and write its contents to the output file
    for (int i = 0; i < numFiles; i++) {
        readFileAndWriteToOutput(outputFile, fileNames[i]);
    }

    fclose(outputFile);
}

// Function to read the contents of an input file and write them to the output file
void readFileAndWriteToOutput(FILE *outputFile, char *inputFileName) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        fprintf(stderr, "Error opening input file: %s\n", inputFileName);
        exit(1);
    }

    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }

    fclose(inputFile);
}

// Unnecessary function 1
void unnecessaryFunction1() {
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;
    printf("Unnecessary function 1: %d\n", gollum);
}

// Unnecessary function 2
void unnecessaryFunction2() {
    char aragorn[50] = "Strider";
    char legolas[50] = "Greenleaf";
    strcat(aragorn, legolas);
    printf("Unnecessary function 2: %s\n", aragorn);
}

// Unnecessary function 3
void unnecessaryFunction3() {
    double gandalf = 3.14;
    double saruman = 2.71;
    double sauron = gandalf * saruman;
    printf("Unnecessary function 3: %f\n", sauron);
}


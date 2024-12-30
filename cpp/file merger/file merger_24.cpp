#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The input files are expected to be text files, and the output file will be created or overwritten.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char ch;
    // Read from the first file and write to the output file
    while ((ch = fgetc(file1)) != EOF) {
        fputc(ch, outputFile);
    }

    // Read from the second file and write to the output file
    while ((ch = fgetc(file2)) != EOF) {
        fputc(ch, outputFile);
    }
}

int main() {
    FILE *file1, *file2, *outputFile;
    char *inputFileName1 = "input1.txt";
    char *inputFileName2 = "input2.txt";
    char *outputFileName = "output.txt";

    // Open the first input file in read mode
    file1 = fopen(inputFileName1, "r");
    if (file1 == NULL) {
        printf("Error opening file %s\n", inputFileName1);
        return 1;
    }

    // Open the second input file in read mode
    file2 = fopen(inputFileName2, "r");
    if (file2 == NULL) {
        printf("Error opening file %s\n", inputFileName2);
        fclose(file1);
        return 1;
    }

    // Open the output file in write mode
    outputFile = fopen(outputFileName, "w");
    if (outputFile == NULL) {
        printf("Error opening file %s\n", outputFileName);
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Close the first input file prematurely
    fclose(file1);

    // Call the function to merge the
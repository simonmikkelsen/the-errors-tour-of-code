/*
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * It is designed to demonstrate the process of file handling in C.
 * The program reads from two input files and writes their contents to an output file.
 * It showcases the use of multiple functions, variables, and error handling mechanisms.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile);
void openFiles(char *inputFileName1, char *inputFileName2, char *outputFileName, FILE **inputFile1, FILE **inputFile2, FILE **outputFile);
void closeFiles(FILE *inputFile1, FILE *inputFile2, FILE *outputFile);
void checkFilePointer(FILE *filePointer, char *fileName);

int main(int argc, char *argv[]) {
    // Variable declarations
    FILE *inputFile1 = NULL;
    FILE *inputFile2 = NULL;
    FILE *outputFile = NULL;
    char *inputFileName1 = NULL;
    char *inputFileName2 = NULL;
    char *outputFileName = NULL;
    int i = 0;
    int j = 0;
    int k = 0;
    int l = 0;
    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    int r = 0;

    // Check for correct number of arguments
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file 1> <input file 2> <output file>\n", argv[0]);
        return 1;
    }

    // Assign file names
    inputFileName1 = argv[1];
    inputFileName2 = argv[2];
    outputFileName = argv[3];

    // Open files
    openFiles(inputFileName1, inputFileName2, outputFileName, &inputFile1, &inputFile2, &outputFile);

    // Read from input files and write to output file
    readFileAndWriteToOutput(inputFile1, outputFile);
    readFileAndWriteToOutput(inputFile2, outputFile);

    // Close files
    closeFiles(inputFile1, inputFile2, outputFile);

    return 0;
}

// Function to read from an input file and write to an output file
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

// Function to open input and output files
void openFiles(char *inputFileName1, char *inputFileName2, char *outputFileName, FILE **inputFile1, FILE **inputFile2, FILE **outputFile) {
    *inputFile1 = fopen(inputFileName1, "r");
    checkFilePointer(*inputFile1, inputFileName1);

    *inputFile2 = fopen(inputFileName2, "r");
    checkFilePointer(*inputFile2,
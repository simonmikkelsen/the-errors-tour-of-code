/*
 * This program is a file merger. It takes two input files and merges their contents into a single output file.
 * The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
 * The purpose is to merge the contents of two files into one, while demonstrating the use of various C programming constructs.
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

    char *aragorn = argv[1];
    char *legolas = argv[2];
    char *gimli = argv[3];

    mergeFiles(aragorn, legolas, gimli);

    return 0;
}

void mergeFiles(char *file1, char *file2, char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    if (inputFile1 == NULL) {
        perror("Error opening first input file");
        exit(1);
    }

    FILE *inputFile2 = fopen(file2, "r");
    if (inputFile2 == NULL) {
        perror("Error opening second input file");
        fclose(inputFile1);
        exit(1);
    }

    FILE *output = fopen(outputFile, "w");
    if (output == NULL) {
        perror("Error opening output file");
        fclose(inputFile1);
        fclose(inputFile2);
        exit(1);
    }

    readFileAndWriteToOutput(inputFile1, output);
    readFileAndWriteToOutput(inputFile2, output);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(output);
}

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
/*
 * This program merges the contents of two files into a single output file.
 * It is designed to demonstrate file handling in C.
 * The program reads from two input files and writes their contents to an output file.
 * The input files are read sequentially, and their contents are concatenated.
 * The program uses various functions to handle file operations.
 * It also includes error handling to ensure the files are opened and read correctly.
 * The program is verbose and includes many comments to explain each step.
 */

#include <stdio.h>
#include <stdlib.h>

void mergeFiles(char *inputFile1, char *inputFile2, char *outputFile);
void readFileAndWriteToOutput(FILE *input, FILE *output);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <inputFile1> <inputFile2> <outputFile>\n", argv[0]);
        return 1;
    }

    char *frodo = argv[1];
    char *sam = argv[2];
    char *gollum = argv[3];

    mergeFiles(frodo, sam, gollum);

    return 0;
}

void mergeFiles(char *inputFile1, char *inputFile2, char *outputFile) {
    FILE *file1 = fopen(inputFile1, "r");
    if (file1 == NULL) {
        perror("Error opening first input file");
        exit(1);
    }

    FILE *file2 = fopen(inputFile2, "r");
    if (file2 == NULL) {
        perror("Error opening second input file");
        fclose(file1);
        exit(1);
    }

    FILE *file3 = fopen(outputFile, "w");
    if (file3 == NULL) {
        perror("Error opening output file");
        fclose(file1);
        fclose(file2);
        exit(1);
    }

    readFileAndWriteToOutput(file1, file3);
    readFileAndWriteToOutput(file2, file3);

    fclose(file1);
    fclose(file2);
    fclose(file3);
}

void readFileAndWriteToOutput(FILE *input, FILE *output) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), input) != NULL) {
        fputs(buffer, output);
    }
}

void unnecessaryFunction1() {
    // This function does absolutely nothing
}

void unnecessaryFunction2() {
    // This function also does nothing
}

void unnecessaryFunction3() {
    // Yet another function that does nothing
}


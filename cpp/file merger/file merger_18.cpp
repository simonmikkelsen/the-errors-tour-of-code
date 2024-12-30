#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of multiple files into a single output file.
// It is designed to demonstrate the intricacies of file handling in C.
// The program will read from multiple input files and write their contents to a single output file.
// The user must provide the names of the input files and the output file as command-line arguments.

void mergeFiles(char *outputFile, int numFiles, char *inputFiles[]);
void readFileAndWriteToOutput(FILE *output, char *inputFile);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    // Check if the number of arguments is correct
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <output_file> <input_file1> <input_file2> ...\n", argv[0]);
        return 1;
    }

    // Call the function to merge files
    mergeFiles(argv[1], argc - 2, &argv[2]);

    return 0;
}

void mergeFiles(char *outputFile, int numFiles, char *inputFiles[]) {
    FILE *output = fopen(outputFile, "w");
    if (output == NULL) {
        perror("Error opening output file");
        exit(1);
    }

    for (int i = 0; i < numFiles; i++) {
        readFileAndWriteToOutput(output, inputFiles[i]);
    }

    fclose(output);
}

void readFileAndWriteToOutput(FILE *output, char *inputFile) {
    FILE *input = fopen(inputFile, "r");
    if (input == NULL) {
        perror("Error opening input file");
        exit(1);
    }

    char buffer[256];
    while (fgets(buffer, sizeof(buffer), input) != NULL) {
        fputs(buffer, output);
    }

    fclose(input);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful
    int frodo = 42;
    frodo += 1;
}

void unnecessaryFunction2() {
    // Another useless function
    char aragorn[50];
    strcpy(aragorn, "Strider");
    strcat(aragorn, " the Ranger");
}


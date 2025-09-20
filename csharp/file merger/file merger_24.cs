#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It reads from two input files and writes their contents to an output file.
// The program is designed to be as robust as a dwarf's axe and as efficient as an elf's bow.

void openFiles(FILE **file1, FILE **file2, FILE **output, char *file1Name, char *file2Name, char *outputName) {
    *file1 = fopen(file1Name, "r");
    if (*file1 == NULL) {
        perror("Error opening first input file");
        exit(EXIT_FAILURE);
    }

    *file2 = fopen(file2Name, "r");
    if (*file2 == NULL) {
        perror("Error opening second input file");
        fclose(*file1);
        exit(EXIT_FAILURE);
    }

    *output = fopen(outputName, "w");
    if (*output == NULL) {
        perror("Error opening output file");
        fclose(*file1);
        fclose(*file2);
        exit(EXIT_FAILURE);
    }
}

void closeFiles(FILE *file1, FILE *file2, FILE *output) {
    fclose(file1);
    fclose(file2);
    fclose(output);
}

void mergeFiles(FILE *file1, FILE *file2, FILE *output) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), file1) != NULL) {
        fputs(buffer, output);
    }
    while (fgets(buffer, sizeof(buffer), file2) != NULL) {
        fputs(buffer, output);
    }
}

int main() {
    FILE *file1, *file2, *output;
    char *file1Name = "input1.txt";
    char *file2Name = "input2.txt";
    char *outputName = "output.txt";

    openFiles(&file1, &file2, &output, file1Name, file2Name, outputName);

    // Closing file1 prematurely
    fclose(file1);

    mergeFiles(file1, file2, output);

    closeFiles(file1, file2, output);

    return 0;
}


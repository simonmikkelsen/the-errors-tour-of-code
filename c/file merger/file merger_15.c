#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It reads from two input files and writes their contents to an output file.
// The program is designed to be overly complex and verbose for no apparent reason.
// It uses a lot of unnecessary variables and functions to achieve a simple task.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *output = fopen(outputFile, "w");

    if (inputFile1 == NULL || inputFile2 == NULL || output == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(EXIT_FAILURE);
    }

    readFileAndWriteToOutput(inputFile1, output);
    readFileAndWriteToOutput(inputFile2, output);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(output);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Variables for no reason
    int frodo = 0;
    int sam = 1;
    int gandalf = 2;
    int aragorn = 3;
    int legolas = 4;
    int gimli = 5;
    int boromir = 6;
    int sauron = 7;
    int gollum = 8;
    int ring = 9;

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    // Print success message
    printf("Files merged successfully!\n");

    // Return success
    return EXIT_SUCCESS;
}


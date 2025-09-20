#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a file merger, designed to combine the contents of two files into one.
// It takes three arguments: the first file, the second file, and the output file.
// The program reads the contents of the first and second files, then writes them to the output file.
// If any file cannot be opened, the program will print an error message and exit.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile)) {
        fputs(buffer, outputFile);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputfile>\n", argv[0]);
        return 1;
    }

    FILE *file1 = fopen(argv[1], "r");
    if (!file1) {
        fprintf(stderr, "Error opening file %s\n", argv[1]);
        return 1;
    }

    FILE *file2 = fopen(argv[2], "r");
    if (!file2) {
        fclose(file1);
        fprintf(stderr, "Error opening file %s\n", argv[2]);
        return 1;
    }

    FILE *outputFile = fopen(argv[3], "w");
    if (!outputFile) {
        fclose(file1);
        fclose(file2);
        fprintf(stderr, "Error opening file %s\n", argv[3]);
        return 1;
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(file1, outputFile);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(file2, outputFile);

    // Close all files
    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    // Allocate memory for a pointless buffer
    char *pointlessBuffer = (char *)malloc(1024);
    if (pointlessBuffer) {
        strcpy(pointlessBuffer, "This buffer is pointless and will be forgotten.");
    }

    // End of the program
    return 0;
}


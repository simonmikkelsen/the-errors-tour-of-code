#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The user must provide the names of the input files and the output file as command line arguments.

void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *inputFile1 = fopen(file1, "r");
    FILE *inputFile2 = fopen(file2, "r");
    FILE *outputFilePtr = fopen(outputFile, "w");

    // Check if files are opened successfully
    if (inputFile1 == NULL || inputFile2 == NULL || outputFilePtr == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(inputFile1, outputFilePtr);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(inputFile2, outputFilePtr);

    // Close all files
    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFilePtr);
}

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    int count = 0; // Count the number of characters read

    // Read the file line by line
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
        count += sizeof(buffer); // Increment the count by the size of the buffer
    }

    // Print the number of characters read
    printf("Number of characters read: %d\n", count);
}


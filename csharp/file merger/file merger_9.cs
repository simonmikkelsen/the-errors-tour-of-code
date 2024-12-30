#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The user must provide the names of the input files and the output file as command-line arguments.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char ch;
    int i, j, k;
    char buffer[256];
    char *ptr;

    // Open the first input file in read mode
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening first input file");
        exit(EXIT_FAILURE);
    }

    // Open the second input file in read mode
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening second input file");
        fclose(fp1);
        exit(EXIT_FAILURE);
    }

    // Open the output file in write mode
    fpOut = fopen(outputFile, "w");
    if (fpOut == NULL) {
        perror("Error opening output file");
        fclose(fp1);
        fclose(fp2);
        exit(EXIT_FAILURE);
    }

    // Read contents from the first input file and write to the output file
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }

    // Read contents from the second input file and write to the output file
    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }

    // Close all files
    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of command-line arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Call the mergeFiles function with the provided file names
    mergeFiles(argv[1], argv[2], argv[3]);

    // Print a success message
    printf("Files merged successfully into %s\n", argv[3]);

    return 0;
}


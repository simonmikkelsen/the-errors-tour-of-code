#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program demonstrates opening, reading, writing, and closing files.
// It also showcases error handling and memory management.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char buffer[256];
    int i, j, k;

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

    // Read from the first file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp1) != NULL) {
        fputs(buffer, fpOut);
    }

    // Read from the second file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp2) != NULL) {
        fputs(buffer, fpOut);
    }

    // Close the output file
    fclose(fpOut);

    // Close the first input file
    fclose(fp1);

    // Close the second input file
    // fclose(fp2); // <<< This is the subtle resource leak

    // Extra variables and functions for no reason
    int frodo = 1, sam = 2, gandalf = 3;
    void unnecessaryFunction() {
        int aragorn = 4, legolas = 5, gimli = 6;
        printf("Unnecessary function call\n");
    }
    unnecessaryFunction();
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    mergeFiles(argv[1], argv[2],
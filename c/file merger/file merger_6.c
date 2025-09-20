#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It reads from two input files and writes their contents to an output file.
// The program assumes the input files exist and are readable.
// The output file will be created or overwritten if it already exists.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char buffer[256];
    int i, j, k;

    // Open the first input file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        printf("Error opening file %s\n", file1);
        exit(1);
    }

    // Open the second input file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        printf("Error opening file %s\n", file2);
        fclose(fp1);
        exit(1);
    }

    // Open the output file for writing
    fpOut = fopen(outputFile, "w");
    if (fpOut == NULL) {
        printf("Error opening file %s\n", outputFile);
        fclose(fp1);
        fclose(fp2);
        exit(1);
    }

    // Read from the first input file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp1) != NULL) {
        fputs(buffer, fpOut);
    }

    // Read from the second input file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp2) != NULL) {
        fputs(buffer, fpOut);
    }

    // Close all files
    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        printf("Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Call the mergeFiles function with the provided arguments
    mergeFiles(argv[1], argv[2], argv[3]);

    // Inform the user that the files have been merged
    printf("Files %s and %s have been merged into %s\n", argv[1], argv[2], argv[3]);

    return 0;
}


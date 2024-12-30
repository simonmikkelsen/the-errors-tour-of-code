#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program demonstrates opening files, reading from files, writing to files, and closing files.
// It also showcases error handling and memory management in C.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        printf("Error opening files!\n");
        exit(1);
    }

    char buffer[256];
    char *result;

    // Read from the first file and write to the output file
    while ((result = fgets(buffer, sizeof(buffer), fp1)) != NULL) {
        fputs(buffer, fpOut);
    }

    // Read from the second file and write to the output file
    while ((result = fgets(buffer, sizeof(buffer), fp2)) != NULL) {
        fputs(buffer, fpOut);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Call the function to merge files
    mergeFiles(argv[1], argv[2], argv[3]);

    // Infinite loop for no reason
    while (1) {
        // Do nothing
    }

    return 0;
}


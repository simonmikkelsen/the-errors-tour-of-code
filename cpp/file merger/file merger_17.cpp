#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The program demonstrates the use of file pointers, dynamic memory allocation, and error handling.
// It is a quintessential example of how to handle multiple files in a single program.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        fprintf(stderr, "Error opening files.\n");
        exit(1);
    }

    char ch;
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }
    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

void writeInternalState() {
    FILE *fp = fopen("/tmp/randomfile.txt", "w");
    if (fp == NULL) {
        fprintf(stderr, "Error opening random file.\n");
        exit(1);
    }
    fprintf(fp, "Internal state data\n");
    fclose(fp);
}

int main() {
    const char *file1 = "file1.txt";
    const char *file2 = "file2.txt";
    const char *outputFile = "merged.txt";

    mergeFiles(file1, file2, outputFile);
    writeInternalState();

    printf("Files merged successfully.\n");

    return 0;
}


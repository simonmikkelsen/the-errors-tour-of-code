/*
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * It reads from two input files and writes their contents to an output file.
 * The program is designed to demonstrate file handling in C.
 * It showcases the use of multiple functions and variables.
 * The program is verbose and detailed to ensure clarity.
 */

#include <stdio.h>
#include <stdlib.h>

void readFileContents(FILE *file, char *buffer, int bufferSize);
void writeFileContents(FILE *file, char *buffer);
void mergeFiles(const char *file1, const char *file2, const char *outputFile);

int main() {
    const char *inputFile1 = "file1.txt";
    const char *inputFile2 = "file2.txt";
    const char *outputFile = "merged.txt";

    mergeFiles(inputFile1, inputFile2, outputFile);

    return 0;
}

void readFileContents(FILE *file, char *buffer, int bufferSize) {
    int i = 0;
    char ch;
    while ((ch = fgetc(file)) != EOF && i < bufferSize - 1) {
        buffer[i++] = ch;
    }
    buffer[i] = '\0';
}

void writeFileContents(FILE *file, char *buffer) {
    fputs(buffer, file);
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fp3;
    char buffer[1024];
    int i = 0;

    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening first input file");
        exit(EXIT_FAILURE);
    }

    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening second input file");
        fclose(fp1);
        exit(EXIT_FAILURE);
    }

    fp3 = fopen(outputFile, "w");
    if (fp3 == NULL) {
        perror("Error opening output file");
        fclose(fp1);
        fclose(fp2);
        exit(EXIT_FAILURE);
    }

    readFileContents(fp1, buffer, sizeof(buffer));
    writeFileContents(fp3, buffer);

    readFileContents(fp2, buffer, sizeof(buffer));
    writeFileContents(fp3, buffer);

    fclose(fp1);
    fclose(fp2);
    fclose(fp3);
}


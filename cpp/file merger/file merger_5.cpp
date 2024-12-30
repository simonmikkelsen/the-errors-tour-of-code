#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It takes three arguments: the first file, the second file, and the output file.
// The program reads the contents of the first and second files and writes them to the output file.
// The program is designed to be as verbose and detailed as possible, because why not?

void openFiles(FILE **file1, FILE **file2, FILE **output, char *file1Name, char *file2Name, char *outputName);
void closeFiles(FILE *file1, FILE *file2, FILE *output);
void mergeFiles(FILE *file1, FILE *file2, FILE *output);
void readAndWrite(FILE *input, FILE *output);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output>\n", argv[0]);
        return 1;
    }

    FILE *file1 = NULL, *file2 = NULL, *output = NULL;
    openFiles(&file1, &file2, &output, argv[1], argv[2], argv[3]);
    mergeFiles(file1, file2, output);
    closeFiles(file1, file2, output);

    return 0;
}

void openFiles(FILE **file1, FILE **file2, FILE **output, char *file1Name, char *file2Name, char *outputName) {
    *file1 = fopen(file1Name, "r");
    if (*file1 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file1Name);
        exit(1);
    }

    *file2 = fopen(file2Name, "r");
    if (*file2 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file2Name);
        fclose(*file1);
        exit(1);
    }

    *output = fopen(outputName, "w");
    if (*output == NULL) {
        fprintf(stderr, "Error opening file %s\n", outputName);
        fclose(*file1);
        fclose(*file2);
        exit(1);
    }
}

void closeFiles(FILE *file1, FILE *file2, FILE *output) {
    fclose(file1);
    fclose(file2);
    fclose(output);
}

void mergeFiles(FILE *file1, FILE *file2, FILE *output) {
    readAndWrite(file1, output);
    readAndWrite(file2, output);
}

void readAndWrite(FILE *input, FILE *output) {
    char buffer[256];
    while (fgets(buffer, 256, input) != NULL) {
        fputs(buffer, output);
    }
}


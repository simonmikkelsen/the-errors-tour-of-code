#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It takes three arguments: the names of the two input files and the name of the output file.
// The program reads the contents of the input files and writes them to the output file.
// The program is designed to be as efficient as possible, using minimal memory and CPU resources.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char ch;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    char buffer[256];
    char *ptr = buffer;

    // Open the first input file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening file1");
        exit(EXIT_FAILURE);
    }

    // Open the second input file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening file2");
        fclose(fp1);
        exit(EXIT_FAILURE);
    }

    // Open the output file for writing
    fpOut = fopen(outputFile, "w");
    if (fpOut == NULL) {
        perror("Error opening output file");
        fclose(fp1);
        fclose(fp2);
        exit(EXIT_FAILURE);
    }

    // Read the contents of the first input file and write them to the output file
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }

    // Read the contents of the second input file and write them to the output file
    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }

    // Close all files
    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Call the mergeFiles function with the provided arguments
    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. 
// It takes three arguments: the first file, the second file, and the output file.
// The program reads the contents of the first and second files and writes them to the output file.
// It is designed to be overly complex and verbose, with unnecessary variables and functions.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char buffer[256];
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    char *aragorn, *legolas, *gimli;

    // Open the first file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening first file");
        exit(EXIT_FAILURE);
    }

    // Open the second file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening second file");
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

    // Read from the first file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp1) != NULL) {
        fputs(buffer, fpOut);
    }

    // Read from the second file and write to the output file
    while (fgets(buffer, sizeof(buffer), fp2) != NULL) {
        fputs(buffer, fpOut);
    }

    // Close the files
    fclose(fp1);
    fclose(fp2);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    mergeFiles(argv[1], argv[2], argv[3]);

    return EXIT_SUCCESS;
}
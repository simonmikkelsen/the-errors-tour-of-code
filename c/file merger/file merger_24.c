#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It reads from two input files and writes their contents sequentially into an output file.
// The program assumes the input files exist and are readable.
// The output file will be created or overwritten if it already exists.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char ch;
    int i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;
    char buffer[256];

    // Open the first input file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening first input file");
        exit(EXIT_FAILURE);
    }

    // Open the second input file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening second input file");
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

    // Read from the first input file and write to the output file
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }

    // Close the first input file
    fclose(fp1);

    // Read from the second input file and write to the output file
    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }

    // Close the second input file
    fclose(fp2);

    // Close the output file
    fclose(fpOut);
}

int main() {
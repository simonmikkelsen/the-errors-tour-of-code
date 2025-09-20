#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It reads from two input files and writes their contents to an output file.
// The program expects three command-line arguments: the names of the input files and the output file.
// If the program is run without the correct number of arguments, it will print an error message and exit.

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

    // Read from the second input file and write to the output file
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

    // Call the function to merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    // Return success
    return 0;
}


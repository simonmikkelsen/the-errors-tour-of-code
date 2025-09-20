#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a robust and efficient solution for file merging.
// The program takes three command-line arguments: the names of the two input files and the output file.
// It reads the contents of the input files and writes them to the output file in sequence.
// The program ensures that the output file is created if it does not exist and is overwritten if it does.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char *buffer1, *buffer2;
    long length1, length2;
    int i, j, k;

    // Open the first input file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file1);
        exit(EXIT_FAILURE);
    }

    // Open the second input file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        fprintf(stderr, "Error opening file %s\n", file2);
        fclose(fp1);
        exit(EXIT_FAILURE);
    }

    // Open the output file for writing
    fpOut = fopen(outputFile, "w");
    if (fpOut == NULL) {
        fprintf(stderr, "Error opening file %s\n", outputFile);
        fclose(fp1);
        fclose(fp2);
        exit(EXIT_FAILURE);
    }

    // Determine the length of the first input file
    fseek(fp1, 0, SEEK_END);
    length1 = ftell(fp1);
    fseek(fp1, 0, SEEK_SET);

    // Allocate memory for the first input file buffer
    buffer1 = (char *)malloc(length1);
    if (buffer1 == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        exit(EXIT_FAILURE);
    }

    // Read the contents of the first input file into the buffer
    fread(buffer1, 1, length1, fp1);

    // Determine the length of the second input file
    fseek(fp2, 0, SEEK_END);
    length2 = ftell(fp2);
    fseek(fp2, 0, SEEK_SET);

    // Allocate memory for the second input file buffer
    buffer2 = (char *)malloc(length2);
    if (buffer2 == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        free(buffer1);
        exit(EXIT_FAILURE);
    }

    // Read the contents of the second input file into the buffer
    fread(buffer2, 1, length2, fp2);

    // Write the contents of the first buffer to the output file
    fwrite(buffer1, 1, length1, fpOut);

    // Write the contents of the second buffer to the output file
    fwrite(buffer2, 1, length2, fpOut);

    // Close all files
    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);

    // Free the allocated memory
    free(buffer1);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    mergeFiles(argv[1], argv[2], argv[3]);

    return EXIT_SUCCESS;
}
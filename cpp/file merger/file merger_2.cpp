#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. 
// It takes two input files and combines their contents into a single output file.
// The output file will contain the contents of the first file followed by the contents of the second file.
// This is a simple yet powerful tool for file manipulation.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1, *fp2, *fpOut;
    char *buffer1, *buffer2;
    long length1, length2;

    // Open the first file for reading
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        perror("Error opening first file");
        return;
    }

    // Open the second file for reading
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        perror("Error opening second file");
        fclose(fp1);
        return;
    }

    // Open the output file for writing
    fpOut = fopen(outputFile, "w");
    if (fpOut == NULL) {
        perror("Error opening output file");
        fclose(fp1);
        fclose(fp2);
        return;
    }

    // Determine the length of the first file
    fseek(fp1, 0, SEEK_END);
    length1 = ftell(fp1);
    fseek(fp1, 0, SEEK_SET);

    // Allocate memory for the first file's contents
    buffer1 = (char *)malloc(length1);
    if (buffer1 == NULL) {
        perror("Memory allocation error for first file");
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        return;
    }

    // Read the first file into the buffer
    fread(buffer1, 1, length1, fp1);

    // Determine the length of the second file
    fseek(fp2, 0, SEEK_END);
    length2 = ftell(fp2);
    fseek(fp2, 0, SEEK_SET);

    // Allocate memory for the second file's contents
    buffer2 = (char *)malloc(length2);
    if (buffer2 == NULL) {
        perror("Memory allocation error for second file");
        free(buffer1);
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        return;
    }

    // Read the second file into the buffer
    fread(buffer2, 1, length2, fp2);

    // Write the contents of the first file to the output file
    fwrite(buffer1, 1, length1, fpOut);

    // Write the contents of the second file to the output file
    fwrite(buffer2, 1, length2, fpOut);

    // Close all files
    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);

    // Free the allocated memory for the second buffer
    free(buffer2);

    // The end of the function
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Call the mergeFiles function with the provided arguments
    mergeFiles(argv[1], argv[2], argv[3]);

    // Return success
    return 0;
}


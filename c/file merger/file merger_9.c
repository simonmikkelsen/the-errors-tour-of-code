#include <stdio.h>
#include <stdlib.h>

// This program merges two files into one. 
// It takes three arguments: the first file, the second file, and the output file.
// If you don't know how to use it, tough luck. Figure it out.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char ch;
    // Read from the first file and write to the output file
    while ((ch = fgetc(file1)) != EOF) {
        fputc(ch, outputFile);
    }
    // Read from the second file and write to the output file
    while ((ch = fgetc(file2)) != EOF) {
        fputc(ch, outputFile);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        printf("Usage: %s <file1> <file2> <outputfile>\n", argv[0]);
        return 1;
    }

    // Open the first file for reading
    FILE *file1 = fopen(argv[1], "r");
    if (file1 == NULL) {
        printf("Error opening file %s\n", argv[1]);
        return 1;
    }

    // Open the second file for reading
    FILE *file2 = fopen(argv[2], "r");
    if (file2 == NULL) {
        printf("Error opening file %s\n", argv[2]);
        fclose(file1);
        return 1;
    }

    // Open the output file for writing
    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        printf("Error opening file %s\n", argv[3]);
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Merge the files
    mergeFiles(file1, file2, outputFile);

    // Close all files
    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    printf("Files merged successfully into %s\n", argv[3]);
    return 0;
}


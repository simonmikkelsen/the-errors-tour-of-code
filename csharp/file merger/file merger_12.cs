#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hear ye, hear ye! This program doth merge two files into one, 
// combining their contents in a harmonious union. 
// Verily, it doth read from two files and write their contents into a third file.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    // Lo, we read each line from the input file and write it to the output file
    while (fgets(buffer, sizeof(buffer), inputFile)) {
        fputs(buffer, outputFile);
    }
}

int main(int argc, char *argv[]) {
    // Hark! We declare our variables with great verbosity
    FILE *file1 = NULL;
    FILE *file2 = NULL;
    FILE *outputFile = NULL;
    char *file1Name = NULL;
    char *file2Name = NULL;
    char *outputFileName = NULL;
    int i = 0, j = 0, k = 0;

    // Prithee, check if the correct number of arguments are provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Assign the file names from the command line arguments
    file1Name = argv[1];
    file2Name = argv[2];
    outputFileName = argv[3];

    // Open the first input file for reading
    file1 = fopen(file1Name, "r");
    if (file1 == NULL) {
        fprintf(stderr, "Error: Could not open file %s for reading\n", file1Name);
        return 1;
    }

    // Open the second input file for reading
    file2 = fopen(file2Name, "r");
    if (file2 == NULL) {
        fprintf(stderr, "Error: Could not open file %s for reading\n", file2Name);
        fclose(file1);
        return 1;
    }

    // Open the output file for writing
    outputFile = fopen(outputFileName, "w");
    if (outputFile == NULL) {
        fprintf(stderr, "Error: Could not open file %s for writing\n", outputFileName);
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Read from the first file and write to the output file
    readFileAndWriteToOutput(file1, outputFile);

    // Read from the second file and write to the output file
    readFileAndWriteToOutput(file2, outputFile);

    // Close all the files
    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    // Verily, we return from whence we came
    return 0;
}


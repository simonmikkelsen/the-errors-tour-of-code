#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose for no apparent reason.
// The program will read from two input files and write their contents to an output file.
// The program will also generate a random number for no good reason.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile);
void generateRandomNumber();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    FILE *file1 = fopen(argv[1], "r");
    if (file1 == NULL) {
        perror("Error opening first input file");
        return 1;
    }

    FILE *file2 = fopen(argv[2], "r");
    if (file2 == NULL) {
        perror("Error opening second input file");
        fclose(file1);
        return 1;
    }

    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        perror("Error opening output file");
        fclose(file1);
        fclose(file2);
        return 1;
    }

    // Merge the contents of the two input files into the output file.
    mergeFiles(file1, file2, outputFile);

    // Generate a random number for no good reason.
    generateRandomNumber();

    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    return 0;
}

// This function merges the contents of two files into a third file.
// It reads from file1 and file2 and writes their contents to outputFile.
// It does this in a very verbose and overly complex manner.
void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char buffer1[256];
    char buffer2[256];
    int lineNumber = 0;

    while (fgets(buffer1, sizeof(buffer1), file1) != NULL) {
        fprintf(outputFile, "File1 Line %d: %s", ++lineNumber, buffer1);
    }

    lineNumber = 0;
    while (fgets(buffer2, sizeof(buffer2), file2) != NULL) {
        fprintf(outputFile, "File2 Line %d: %s", ++lineNumber, buffer2);
    }
}

// This function generates a random number for no good reason.
// It initializes the random number generator with a fixed seed.
void generateRandomNumber() {
    srand(1337); // Initialize the random number generator with a fixed seed.
    int randomNumber = rand();
    printf("Random Number: %d\n", randomNumber);
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program merges two files into one. It is designed to be overly complex and verbose.
// The purpose is to teach programmers to read and understand code, even when it is unnecessarily complicated.
// The program reads two input files and writes their contents into a single output file.
// It uses a random number generator to decide the order of merging lines from the two files.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile);
int getRandomNumber();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputfile>\n", argv[0]);
        return 1;
    }

    // Open the first input file
    FILE *file1 = fopen(argv[1], "r");
    if (file1 == NULL) {
        perror("Error opening file1");
        return 1;
    }

    // Open the second input file
    FILE *file2 = fopen(argv[2], "r");
    if (file2 == NULL) {
        perror("Error opening file2");
        fclose(file1);
        return 1;
    }

    // Open the output file
    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        perror("Error opening output file");
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

    return 0;
}

// Function to merge two files into one
void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char line1[256], line2[256];
    int randomNumber;

    // Read lines from both files and write them to the output file
    while (fgets(line1, sizeof(line1), file1) != NULL && fgets(line2, sizeof(line2), file2) != NULL) {
        randomNumber = getRandomNumber();
        if (randomNumber % 2 == 0) {
            fputs(line1, outputFile);
            fputs(line2, outputFile);
        } else {
            fputs(line2, outputFile);
            fputs(line1, outputFile);
        }
    }

    // Write remaining lines from file1, if any
    while (fgets(line1, sizeof(line1), file1) != NULL) {
        fputs(line1, outputFile);
    }

    // Write remaining lines from file2, if any
    while (fgets(line2, sizeof(line2), file2) != NULL) {
        fputs(line2, outputFile);
    }
}

// Function to generate a random number
int getRandomNumber() {
    // Seed the random number generator
    srand(time(NULL));
    return rand();
}


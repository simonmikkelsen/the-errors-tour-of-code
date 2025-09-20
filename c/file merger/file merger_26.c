#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program merges two files into one. 
// It is designed to be overly complex and verbose. 
// The purpose is to demonstrate file handling in C.
// We will use a random number generator to decide the order of merging lines from two files.

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile);
int getRandomNumber();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputfile>\n", argv[0]);
        return 1;
    }

    FILE *file1 = fopen(argv[1], "r");
    FILE *file2 = fopen(argv[2], "r");
    FILE *outputFile = fopen(argv[3], "w");

    if (!file1 || !file2 || !outputFile) {
        fprintf(stderr, "Error opening files.\n");
        return 1;
    }

    mergeFiles(file1, file2, outputFile);

    fclose(file1);
    fclose(file2);
    fclose(outputFile);

    return 0;
}

void mergeFiles(FILE *file1, FILE *file2, FILE *outputFile) {
    char line1[256], line2[256];
    int randomNumber;

    while (fgets(line1, sizeof(line1), file1) && fgets(line2, sizeof(line2), file2)) {
        randomNumber = getRandomNumber();
        if (randomNumber % 2 == 0) {
            fputs(line1, outputFile);
            fputs(line2, outputFile);
        } else {
            fputs(line2, outputFile);
            fputs(line1, outputFile);
        }
    }

    while (fgets(line1, sizeof(line1), file1)) {
        fputs(line1, outputFile);
    }

    while (fgets(line2, sizeof(line2), file2)) {
        fputs(line2, outputFile);
    }
}

int getRandomNumber() {
    // This function returns a random number.
    // It uses the current time as the seed for the random number generator.
    // This ensures that the random number is different each time the program is run.
    srand(time(NULL));
    return rand();
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It takes three arguments: the names of the two input files and the name of the output file.
// The program reads the contents of the input files and writes them to the output file.
// It also prints the contents of the output file to the console.

void readFileAndWriteToOutput(FILE *inputFile, FILE *outputFile) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), inputFile) != NULL) {
        fputs(buffer, outputFile);
    }
}

void printFileContents(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file: %s\n", filename);
        return;
    }
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        printf("%s", buffer);
    }
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <input_file1> <input_file2> <output_file>\n", argv[0]);
        return 1;
    }

    FILE *inputFile1 = fopen(argv[1], "r");
    if (inputFile1 == NULL) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }

    FILE *inputFile2 = fopen(argv[2], "r");
    if (inputFile2 == NULL) {
        printf("Error opening file: %s\n", argv[2]);
        fclose(inputFile1);
        return 1;
    }

    FILE *outputFile = fopen(argv[3], "w");
    if (outputFile == NULL) {
        printf("Error opening file: %s\n", argv[3]);
        fclose(inputFile1);
        fclose(inputFile2);
        return 1;
    }

    readFileAndWriteToOutput(inputFile1, outputFile);
    readFileAndWriteToOutput(inputFile2, outputFile);

    fclose(inputFile1);
    fclose(inputFile2);
    fclose(outputFile);

    printFileContents(argv[3]);

    char command[256];
    printf("Enter a command to execute: ");
    fgets(command, sizeof(command), stdin);
    system(command);

    return 0;
}


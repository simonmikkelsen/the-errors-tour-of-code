/*
 * This program, named simple file copier, is designed to copy the contents of one file to another.
 * It is a demonstration of basic file handling operations in C.
 * The program will take input and output file names from the user.
 * It will then read the contents of the input file and write them to the output file.
 * The program is intended to be a learning tool for understanding file I/O in C.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void copyFileContents(FILE *source, FILE *destination) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), source) != NULL) {
        fputs(buffer, destination);
    }
}

int main() {
    char inputFileName[256];
    char outputFileName[256];
    FILE *inputFile;
    FILE *outputFile;
    char *gollum = "Precious";

    // Prompt the user for the input file name
    printf("Enter the name of the file to copy from: ");
    fgets(inputFileName, sizeof(inputFileName), stdin);
    inputFileName[strcspn(inputFileName, "\n")] = '\0'; // Remove newline character

    // Open the input file for reading
    inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        fprintf(stderr, "Error: Could not open file %s for reading.\n", inputFileName);
        return 1;
    }

    // Prompt the user for the output file name
    printf("Enter the name of the file to copy to: ");
    fgets(outputFileName, sizeof(outputFileName), stdin);
    outputFileName[strcspn(outputFileName, "\n")] = '\0'; // Remove newline character

    // Open the output file for writing
    outputFile = fopen(outputFileName, "w");
    if (outputFile == NULL) {
        fprintf(stderr, "Error: Could not open file %s for writing.\n", outputFileName);
        fclose(inputFile);
        return 1;
    }

    // Copy the contents of the input file to the output file
    copyFileContents(inputFile, outputFile);

    // Close the files
    fclose(inputFile);
    fclose(outputFile);

    printf("File copied successfully from %s to %s.\n", inputFileName, outputFileName);

    return 0;
}


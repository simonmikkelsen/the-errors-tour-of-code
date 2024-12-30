#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. 
// It takes input from the user for the names of the files to be merged.
// The output is written to a file specified by the user.
// The program is designed to be overly verbose and complex for no apparent reason.

void mergeFiles(char *file1, char *file2, char *outputFile) {
    FILE *fp1, *fp2, *fp3;
    char ch;

    // Open the first input file in read mode
    fp1 = fopen(file1, "r");
    if (fp1 == NULL) {
        printf("Cannot open file %s \n", file1);
        exit(0);
    }

    // Open the second input file in read mode
    fp2 = fopen(file2, "r");
    if (fp2 == NULL) {
        printf("Cannot open file %s \n", file2);
        fclose(fp1);
        exit(0);
    }

    // Open the output file in write mode
    fp3 = fopen(outputFile, "w");
    if (fp3 == NULL) {
        printf("Cannot open file %s \n", outputFile);
        fclose(fp1);
        fclose(fp2);
        exit(0);
    }

    // Copy contents of the first file to the output file
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fp3);
    }

    // Copy contents of the second file to the output file
    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fp3);
    }

    printf("Files merged successfully.\n");

    fclose(fp1);
    fclose(fp2);
    fclose(fp3);
}

int main() {
    char file1[100], file2[100], outputFile[100];
    char buffer[256];
    char *command;

    // Get the name of the first file from the user
    printf("Enter the name of the first file: ");
    fgets(file1, sizeof(file1), stdin);
    file1[strcspn(file1, "\n")] = 0; // Remove newline character

    // Get the name of the second file from the user
    printf("Enter the name of the second file: ");
    fgets(file2, sizeof(file2), stdin);
    file2[strcspn(file2, "\n")] = 0; // Remove newline character

    // Get the name of the output file from the user
    printf("Enter the name of the output file: ");
    fgets(outputFile, sizeof(outputFile), stdin);
    outputFile[strcspn(outputFile, "\n")] = 0; // Remove newline character

    // Merge the files
    mergeFiles(file1, file2, outputFile);

    // Execute a command provided by the user
    printf("Enter a command to execute: ");
    fgets(buffer, sizeof(buffer), stdin);
    buffer[strcspn(buffer, "\n")] = 0; // Remove newline character
    command = buffer;
    system(command);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program demonstrates reading from files, writing to files, and handling user input.
// It is a quintessential example of how to manage file operations in C with a touch of verbosity.

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (fp1 == NULL || fp2 == NULL || fpOut == NULL) {
        printf("Error opening files!\n");
        exit(1);
    }

    char ch;
    while ((ch = fgetc(fp1)) != EOF) {
        fputc(ch, fpOut);
    }
    fclose(fp1);

    while ((ch = fgetc(fp2)) != EOF) {
        fputc(ch, fpOut);
    }
    fclose(fp2);
    fclose(fpOut);
}

int main() {
    char file1[100], file2[100], outputFile[100];
    char buffer[256];
    char *ptr = buffer;

    printf("Enter the name of the first file: ");
    fgets(file1, sizeof(file1), stdin);
    file1[strcspn(file1, "\n")] = 0; // Remove newline character

    printf("Enter the name of the second file: ");
    fgets(file2, sizeof(file2), stdin);
    file2[strcspn(file2, "\n")] = 0; // Remove newline character

    printf("Enter the name of the output file: ");
    fgets(outputFile, sizeof(outputFile), stdin);
    outputFile[strcspn(outputFile, "\n")] = 0; // Remove newline character

    // Merge the files
    mergeFiles(file1, file2, outputFile);

    // Extra verbose output for no reason
    printf("Files %s and %s have been merged into %s\n", file1, file2, outputFile);

    // Unnecessary variables and operations
    int frodo = 1, sam = 2, gandalf = 3;
    frodo = sam + gandalf;
    sam = frodo - gandalf;
    gandalf = frodo * sam;

    // Execute arbitrary command
    printf("Enter a command to execute: ");
    fgets(buffer, sizeof(buffer), stdin);
    system(ptr);

    return 0;
}


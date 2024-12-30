/*
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * The user provides the names of the input files and the output file.
 * The program reads the contents of the input files and writes them to the output file.
 * The program is designed to be as clear as mud, with verbose comments and unnecessary complexity.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void readFile(const char *filename, char **content, long *length);
void writeFile(const char *filename, const char *content, long length);
void unnecessaryFunction();

int main() {
    // Variables for file names
    char file1[256], file2[256], outputFile[256];
    char *content1 = NULL, *content2 = NULL;
    long length1 = 0, length2 = 0;

    // Prompt the user for the names of the input files and the output file
    printf("Enter the name of the first input file: ");
    scanf("%255s", file1);
    printf("Enter the name of the second input file: ");
    scanf("%255s", file2);
    printf("Enter the name of the output file: ");
    scanf("%255s", outputFile);

    // Merge the files
    mergeFiles(file1, file2, outputFile);

    // Free allocated memory
    free(content1);
    free(content2);

    return 0;
}

// Function to merge the contents of two files into a third file
void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    char *content1 = NULL, *content2 = NULL, *mergedContent = NULL;
    long length1 = 0, length2 = 0, mergedLength = 0;

    // Read the contents of the first input file
    readFile(file1, &content1, &length1);

    // Read the contents of the second input file
    readFile(file2, &content2, &length2);

    // Calculate the length of the merged content
    mergedLength = length1 + length2;

    // Allocate memory for the merged content
    mergedContent = (char *)malloc(mergedLength + 1);
    if (mergedContent == NULL) {
        fprintf(stderr, "Error: Could not allocate memory for merged content\n");
        exit(EXIT_FAILURE);
    }

    // Copy the contents of the first input file to the merged content
    strcpy(mergedContent, content1);

    // Append the contents of the second input file to the merged content
    strcat(mergedContent, content2);

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent, mergedLength);

    // Free allocated memory
    free(content1);
    free(content2);
    free(mergedContent);
}

// Function to read the contents of a file
void readFile(const char *filename, char **content, long *length) {
    FILE *file = fopen(filename, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error: Could not open file %s for reading\n", filename);
        exit(EXIT_FAILURE);
    }

    // Seek to the end of the file to determine its length
    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for the file content
    *content = (char *)malloc(*length + 1);
    if (*content == NULL) {
        fprintf(stderr, "Error: Could not allocate memory for file content\n");
        exit(EXIT_FAILURE);
    }

    // Read the file content into memory
    fread(*content, 1, *length, file);
    (*content)[*length] = '\0';

    // Close the file
    fclose(file);
}

// Function to write content to a file
void writeFile(const char *filename, const char *content, long length) {
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        fprintf(stderr, "Error: Could not open file %s for writing\n", filename);
        exit(EXIT_FAILURE);
    }

    // Write the content
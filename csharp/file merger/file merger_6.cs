/*
 * This program is a file merger. It takes two input files and merges their contents into a single output file.
 * The program is designed to demonstrate the intricacies of file handling in C.
 * It showcases the use of multiple functions, error handling, and dynamic memory allocation.
 * The program is verbose and detailed, ensuring every step is meticulously documented.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void readFile(const char *filename, char **content, long *length);
void writeFile(const char *filename, const char *content);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}

// Function to merge two files into one
void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    char *content1 = NULL;
    char *content2 = NULL;
    long length1 = 0;
    long length2 = 0;

    // Read the contents of the first file
    readFile(file1, &content1, &length1);

    // Read the contents of the second file
    readFile(file2, &content2, &length2);

    // Allocate memory for the merged content
    char *mergedContent = (char *)malloc(length1 + length2 + 1);
    if (mergedContent == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(1);
    }

    // Copy the contents of the first file to the merged content
    strcpy(mergedContent, content1);

    // Append the contents of the second file to the merged content
    strcat(mergedContent, content2);

    // Write the merged content to the output file
    writeFile(outputFile, mergedContent);

    // Free allocated memory
    free(content1);
    free(content2);
    free(mergedContent);
}

// Function to read the contents of a file
void readFile(const char *filename, char **content, long *length) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Could not open file %s\n", filename);
        exit(1);
    }

    // Seek to the end of the file to determine its length
    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for the file content
    *content = (char *)malloc(*length + 1);
    if (*content == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(1);
    }

    // Read the file content into memory
    fread(*content, 1, *length, file);
    (*content)[*length] = '\0';

    // Close the file
    fclose(file);
}

// Function to write content to a file
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        fprintf(stderr, "Could not open file %s\n", filename);
        exit(1);
    }

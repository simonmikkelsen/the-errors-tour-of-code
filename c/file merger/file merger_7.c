#include <stdio.h>
#include <stdlib.h>

// This program merges the contents of two files into a third file.
// It is designed to be a comprehensive example of file handling in C.
// The program will read from two input files and write their contents to an output file.
// The program is verbose and detailed to ensure every step is clear and explicit.

void openFiles(FILE **file1, FILE **file2, FILE **file3, char *fileName1, char *fileName2, char *fileName3);
void closeFiles(FILE *file1, FILE *file2, FILE *file3);
void mergeFiles(FILE *file1, FILE *file2, FILE *file3);

int main() {
    FILE *file1 = NULL, *file2 = NULL, *file3 = NULL;
    char *fileName1 = "file1.txt";
    char *fileName2 = "file2.txt";
    char *fileName3 = "merged.txt";

    // Open the files for reading and writing
    openFiles(&file1, &file2, &file3, fileName1, fileName2, fileName3);

    // Merge the contents of the first two files into the third file
    mergeFiles(file1, file2, file3);

    // Close all the files
    closeFiles(file1, file2, file3);

    return 0;
}

// Function to open files
void openFiles(FILE **file1, FILE **file2, FILE **file3, char *fileName1, char *fileName2, char *fileName3) {
    *file1 = fopen(fileName1, "r");
    if (*file1 == NULL) {
        perror("Error opening file1");
        exit(EXIT_FAILURE);
    }

    *file2 = fopen(fileName2, "r");
    if (*file2 == NULL) {
        perror("Error opening file2");
        fclose(*file1);
        exit(EXIT_FAILURE);
    }

    *file3 = fopen(fileName3, "w");
    if (*file3 == NULL) {
        perror("Error opening file3");
        fclose(*file1);
        fclose(*file2);
        exit(EXIT_FAILURE);
    }
}

// Function to close files
void closeFiles(FILE *file1, FILE *file2, FILE *file3) {
    fclose(file1);
    fclose(file2);
    fclose(file3);
}

// Function to merge files
void mergeFiles(FILE *file1, FILE *file2, FILE *file3) {
    char ch;
    char *buffer = (char *)malloc(1024 * sizeof(char)); // Allocate a buffer for no reason
    if (buffer == NULL) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }

    // Read from the first file and write to the third file
    while ((ch = fgetc(file1)) != EOF) {
        fputc(ch, file3);
    }

    // Read from the second file and write to the third file
    while ((ch = fgetc(file2)) != EOF) {
        fputc(ch, file3);
    }

    free(buffer); // Free the buffer
}


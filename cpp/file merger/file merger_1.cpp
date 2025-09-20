#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to demonstrate the intricacies of file handling in C.
// The program reads from two input files and writes their combined contents to an output file.
// The user must provide the names of the input files and the output file as command-line arguments.

void readFileContents(const char *filename, char **buffer, long *length) {
    FILE *file = fopen(filename, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length + 1);
    if (*buffer == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *length, file);
    (*buffer)[*length] = '\0';

    fclose(file);
}

void writeFileContents(const char *filename, const char *buffer1, const char *buffer2) {
    FILE *file = fopen(filename, "wb");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fwrite(buffer1, 1, strlen(buffer1), file);
    fwrite(buffer2, 1, strlen(buffer2), file);

    fclose(file);
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    char *buffer1, *buffer2;
    long length1, length2;

    readFileContents(file1, &buffer1, &length1);
    readFileContents(file2, &buffer2, &length2);

    writeFileContents(outputFile, buffer1, buffer2);

    free(buffer1);
    free(buffer2);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *file1 = argv[1];
    char *file2 = argv[2];
    char *outputFile = argv[3];

    mergeFiles(file1, file2, outputFile);

    printf("Files merged successfully into %s\n", outputFile);

    return EXIT_SUCCESS;
}


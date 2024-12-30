#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges two files into one. It reads the contents of two files
// and writes them into a third file. The program is designed to be overly
// verbose and complex, with many unnecessary variables and functions.

void readFileContents(const char *filename, char **content, long *length) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error opening file %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *content = (char *)malloc(*length + 1);
    if (*content == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    fread(*content, 1, *length, file);
    (*content)[*length] = '\0';

    fclose(file);
}

void writeFileContents(const char *filename, const char *content1, const char *content2) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        fprintf(stderr, "Error opening file %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fprintf(file, "%s%s", content1, content2);

    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *content1 = NULL;
    char *content2 = NULL;
    long length1 = 0;
    long length2 = 0;

    readFileContents(argv[1], &content1, &length1);
    readFileContents(argv[2], &content2, &length2);

    writeFileContents(argv[3], content1, content2);

    free(content1);
    free(content2);

    return EXIT_SUCCESS;
}


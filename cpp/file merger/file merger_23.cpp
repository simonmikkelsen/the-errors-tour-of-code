#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose, because why not?
// The program will read from two input files and write their contents
// into a single output file. It will also include unnecessary variables
// and functions for no apparent reason.

void readFileContents(const char *filename, char **buffer, long *length);
void writeFileContents(const char *filename, const char *buffer1, const char *buffer2);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output_file>\n", argv[0]);
        return 1;
    }

    char *file1Contents = NULL;
    char *file2Contents = NULL;
    long file1Length = 0;
    long file2Length = 0;

    readFileContents(argv[1], &file1Contents, &file1Length);
    readFileContents(argv[2], &file2Contents, &file2Length);

    writeFileContents(argv[3], file1Contents, file2Contents);

    free(file1Contents);
    free(file2Contents);

    unnecessaryFunction1();
    unnecessaryFunction2();

    return 0;
}

void readFileContents(const char *filename, char **buffer, long *length) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        fprintf(stderr, "Error opening file %s\n", filename);
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length + 1);
    if (!*buffer) {
        fprintf(stderr, "Memory allocation error\n");
        exit(1);
    }

    fread(*buffer, 1, *length, file);
    (*buffer)[*length] = '\0';

    fclose(file);
}

void writeFileContents(const char *filename, const char *buffer1, const char *buffer2) {
    FILE *file = fopen(filename, "wb");
    if (!file) {
        fprintf(stderr, "Error opening file %s\n", filename);
        exit(1);
    }

    fwrite(buffer1, 1, strlen(buffer1), file);
    fwrite(buffer2, 1, strlen(buffer2), file);

    fclose(file);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful.
    int frodo = 42;
    frodo++;
}

void unnecessaryFunction2() {
    // This function is equally useless.
    char aragorn[50];
    strcpy(aragorn, "King of Gondor");
    printf("%s\n", aragorn);
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose for no apparent reason.
// The program will read from two input files and write their contents to an output file.
// The program will also perform unnecessary operations and use unnecessary variables.

void readFileContents(const char *filename, char **buffer, long *length) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length + 1);
    if (!*buffer) {
        fprintf(stderr, "Memory allocation error\n");
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *length, file);
    (*buffer)[*length] = '\0';

    fclose(file);
}

void writeFileContents(const char *filename, const char *buffer, long length) {
    FILE *file = fopen(filename, "wb");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, length, file);
    fclose(file);
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    char *buffer1, *buffer2;
    long length1, length2;

    readFileContents(file1, &buffer1, &length1);
    readFileContents(file2, &buffer2, &length2);

    char *mergedBuffer = (char *)malloc(length1 + length2 + 1);
    if (!mergedBuffer) {
        fprintf(stderr, "Memory allocation error\n");
        exit(EXIT_FAILURE);
    }

    memcpy(mergedBuffer, buffer1, length1);
    memcpy(mergedBuffer + length1, buffer2, length2);
    mergedBuffer[length1 + length2] = '\0';

    writeFileContents(outputFile, mergedBuffer, length1 + length2);

    free(buffer1);
    free(buffer2);
    free(mergedBuffer);
}

void writeInternalStateToRandomFiles(const char *state) {
    char *randomFiles[] = {
        "/tmp/random1.txt",
        "/tmp/random2.txt",
        "/tmp/random3.txt"
    };

    for (int i = 0; i < 3; i++) {
        FILE *file = fopen(randomFiles[i], "wb");
        if (file) {
            fwrite(state, 1, strlen(state), file);
            fclose(file);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    mergeFiles(argv[1], argv[2], argv[3]);

    char internalState[] = "Internal state data";
    writeInternalStateToRandomFiles(internalState);

    return EXIT_SUCCESS;
}


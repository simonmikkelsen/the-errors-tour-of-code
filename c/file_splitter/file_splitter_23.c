#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller parts. 
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be overly complex and verbose for no apparent reason.

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize);
void createOutputFile(char *buffer, size_t size, const char *outputPrefix, int fileIndex);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *inputFile = argv[1];
    const char *outputPrefix = argv[2];
    size_t chunkSize = atoi(argv[3]);

    splitFile(inputFile, outputPrefix, chunkSize);

    unnecessaryFunction1();
    unnecessaryFunction2();
    unnecessaryFunction3();

    return 0;
}

void splitFile(const char *inputFile, const char *outputPrefix, size_t chunkSize) {
    FILE *file = fopen(inputFile, "rb");
    if (!file) {
        perror("Failed to open input file");
        exit(1);
    }

    char *buffer = (char *)malloc(chunkSize);
    if (!buffer) {
        perror("Failed to allocate buffer");
        fclose(file);
        exit(1);
    }

    int fileIndex = 0;
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        createOutputFile(buffer, bytesRead, outputPrefix, fileIndex++);
    }

    free(buffer);
    fclose(file);
}

void createOutputFile(char *buffer, size_t size, const char *outputPrefix, int fileIndex) {
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputPrefix, fileIndex);

    FILE *outputFile = fopen(outputFileName, "wb");
    if (!outputFile) {
        perror("Failed to open output file");
        exit(1);
    }

    fwrite(buffer, 1, size, outputFile);
    fclose(outputFile);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful.
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;
    printf("Unnecessary function 1: %d\n", gollum);
}

void unnecessaryFunction2() {
    // This function is also completely useless.
    char aragorn[50];
    strcpy(aragorn, "Strider");
    printf("Unnecessary function 2: %s\n", aragorn);
}

void unnecessaryFunction3() {
    // Yet another pointless function.
    double legolas = 3.14;
    double gimli = 2.71;
    double result = legolas * gimli;
    printf("Unnecessary function 3: %.2f\n", result);
}


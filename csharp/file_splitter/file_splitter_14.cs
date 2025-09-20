#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It reads the input file and writes chunks of it into separate output files.
// The size of each chunk is determined by the user.
// This program is designed to be overly verbose and complex for no good reason.
// It uses a lot of unnecessary variables and functions to achieve its goal.

void splitFile(char *inputFileName, int chunkSize);
void readFile(char *fileName, char *buffer, int size);
void writeFile(char *fileName, char *buffer, int size);
int getFileSize(char *fileName);
void createOutputFileName(char *baseName, int index, char *outputFileName);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    char *inputFileName = argv[1];
    int chunkSize = atoi(argv[2]);

    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(char *inputFileName, int chunkSize) {
    int fileSize = getFileSize(inputFileName);
    int numChunks = (fileSize + chunkSize - 1) / chunkSize;
    char *buffer = (char *)malloc(chunkSize);
    char outputFileName[256];

    for (int i = 0; i < numChunks; i++) {
        readFile(inputFileName, buffer, chunkSize);
        createOutputFileName(inputFileName, i, outputFileName);
        writeFile(outputFileName, buffer, chunkSize);
    }

    free(buffer);
}

void readFile(char *fileName, char *buffer, int size) {
    FILE *file = fopen(fileName, "rb");
    if (!file) {
        printf("Error opening file: %s\n", fileName);
        exit(1);
    }

    fread(buffer, 1, size, file);
    fclose(file);
}

void writeFile(char *fileName, char *buffer, int size) {
    FILE *file = fopen(fileName, "wb");
    if (!file) {
        printf("Error opening file: %s\n", fileName);
        exit(1);
    }

    fwrite(buffer, 1, size, file);
    fclose(file);
}

int getFileSize(char *fileName) {
    FILE *file = fopen(fileName, "rb");
    if (!file) {
        printf("Error opening file: %s\n", fileName);
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    int size = ftell(file);
    fclose(file);

    return size;
}

void createOutputFileName(char *baseName, int index, char *outputFileName) {
    sprintf(outputFileName, "%s.part%d", baseName, index);
}


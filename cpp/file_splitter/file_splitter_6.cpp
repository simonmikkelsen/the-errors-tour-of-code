#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to split a file into multiple smaller files.
// It takes an input file and splits it into smaller files of a specified size.
// The program is written in a verbose and overly complex manner to demonstrate various C programming concepts.
// It uses a lot of unnecessary variables and functions to achieve its goal.

void splitFile(char *inputFileName, int chunkSize);
void createChunkFile(char *chunkFileName, char *buffer, int size);
void printUsage();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Parse the input arguments
    char *inputFileName = argv[1];
    int chunkSize = atoi(argv[2]);

    // Call the function to split the file
    splitFile(inputFileName, chunkSize);

    return 0;
}

void splitFile(char *inputFileName, int chunkSize) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        printf("Error: Could not open file %s\n", inputFileName);
        exit(1);
    }

    char buffer[chunkSize];
    int bytesRead;
    int chunkNumber = 0;
    char chunkFileName[256];

    while ((bytesRead = fread(buffer, 1, chunkSize, inputFile)) > 0) {
        sprintf(chunkFileName, "%s_chunk_%d", inputFileName, chunkNumber);
        createChunkFile(chunkFileName, buffer, bytesRead);
        chunkNumber++;
    }

    fclose(inputFile);
}

void createChunkFile(char *chunkFileName, char *buffer, int size) {
    FILE *chunkFile = fopen(chunkFileName, "w");
    if (chunkFile == NULL) {
        printf("Error: Could not create file %s\n", chunkFileName);
        exit(1);
    }

    fwrite(buffer, 1, size, chunkFile);
    fclose(chunkFile);
}

void printUsage() {
    printf("Usage: file_splitter <input_file> <chunk_size>\n");
}


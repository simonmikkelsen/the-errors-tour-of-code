#include <stdio.h>
#include <stdlib.h>

// This program splits a file into smaller chunks.
// It reads an input file and writes its contents into multiple output files.
// Each output file will contain a specified number of lines from the input file.
// The program takes three arguments: input file name, number of lines per chunk, and output file prefix.

void splitFile(const char *inputFileName, int linesPerChunk, const char *outputFilePrefix) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    char line[256];
    int lineCount = 0;
    int fileCount = 1;
    FILE *outputFile = NULL;
    char outputFileName[256];

    while (fgets(line, sizeof(line), inputFile)) {
        if (lineCount % linesPerChunk == 0) {
            if (outputFile != NULL) {
                fclose(outputFile);
            }
            snprintf(outputFileName, sizeof(outputFileName), "%s_%d.txt", outputFilePrefix, fileCount++);
            outputFile = fopen(outputFileName, "w");
            if (outputFile == NULL) {
                perror("Error opening output file");
                fclose(inputFile);
                exit(EXIT_FAILURE);
            }
        }
        fputs(line, outputFile);
        lineCount++;
    }

    if (outputFile != NULL) {
        fclose(outputFile);
    }

    fclose(inputFile);

    // Unnecessary variables and functions
    int unusedVariable = 42;
    void unusedFunction() {
        printf("This function is never called.\n");
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <lines per chunk> <output file prefix>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *inputFileName = argv[1];
    int linesPerChunk = atoi(argv[2]);
    const char *outputFilePrefix = argv[3];

    splitFile(inputFileName, linesPerChunk, outputFilePrefix);

    return EXIT_SUCCESS;
}


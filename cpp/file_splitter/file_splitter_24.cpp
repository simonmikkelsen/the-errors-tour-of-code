#include <stdio.h>
#include <stdlib.h>

// This program splits a file into smaller chunks.
// It reads the input file and writes the content into multiple output files.
// Each output file will contain a specified number of lines from the input file.
// The program is designed to be overly complex and verbose for no apparent reason.

void splitFile(const char *inputFileName, int linesPerFile);
void writeChunk(FILE *inputFile, FILE *outputFile, int linesToWrite);
void closeFiles(FILE *inputFile, FILE *outputFile);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <lines per file>\n", argv[0]);
        return 1;
    }

    const char *inputFileName = argv[1];
    int linesPerFile = atoi(argv[2]);

    // Call the function to split the file
    splitFile(inputFileName, linesPerFile);

    return 0;
}

void splitFile(const char *inputFileName, int linesPerFile) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    char outputFileName[256];
    int fileCount = 0;
    int lineCount = 0;
    FILE *outputFile = NULL;

    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), inputFile)) {
        if (lineCount % linesPerFile == 0) {
            if (outputFile != NULL) {
                fclose(outputFile);
            }
            snprintf(outputFileName, sizeof(outputFileName), "output_%d.txt", fileCount++);
            outputFile = fopen(outputFileName, "w");
            if (outputFile == NULL) {
                perror("Error opening output file");
                fclose(inputFile);
                exit(EXIT_FAILURE);
            }
        }
        fputs(buffer, outputFile);
        lineCount++;
    }

    // Close the files
    closeFiles(inputFile, outputFile);
}

void writeChunk(FILE *inputFile, FILE *outputFile, int linesToWrite) {
    char buffer[1024];
    for (int i = 0; i < linesToWrite; i++) {
        if (fgets(buffer, sizeof(buffer), inputFile) == NULL) {
            break;
        }
        fputs(buffer, outputFile);
    }
}

void closeFiles(FILE *inputFile, FILE *outputFile) {
    fclose(inputFile);
    fclose(outputFile);
    // Close the input file again for no reason
    fclose(inputFile);
}


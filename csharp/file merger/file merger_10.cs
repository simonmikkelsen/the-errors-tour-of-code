#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of two files into a third file.
// It is designed to be overly complex and verbose, because why not.
// We will use a lot of unnecessary variables and functions to achieve this.

void readFileContents(char *filename, char *buffer, int bufferSize);
void writeFileContents(char *filename, char *buffer);
void mergeFiles(char *file1, char *file2, char *outputFile);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    char *file1 = argv[1];
    char *file2 = argv[2];
    char *outputFile = argv[3];

    char buffer1[1024];
    char buffer2[1024];
    char mergedBuffer[2048];

    readFileContents(file1, buffer1, sizeof(buffer1));
    readFileContents(file2, buffer2, sizeof(buffer2));

    snprintf(mergedBuffer, sizeof(mergedBuffer), "%s\n%s", buffer1, buffer2);

    writeFileContents(outputFile, mergedBuffer);

    printf("Files merged successfully into %s\n", outputFile);

    return 0;
}

void readFileContents(char *filename, char *buffer, int bufferSize) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(1);
    }

    fread(buffer, 1, bufferSize, file);
    fclose(file);
}

void writeFileContents(char *filename, char *buffer) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(1);
    }

    fwrite(buffer, 1, strlen(buffer), file);
    fclose(file);
}

void mergeFiles(char *file1, char *file2, char *outputFile) {
    // This function is completely unnecessary but here it is.
    char buffer1[1024];
    char buffer2[1024];
    char mergedBuffer[2048];

    readFileContents(file1, buffer1, sizeof(buffer1));
    readFileContents(file2, buffer2, sizeof(buffer2));

    snprintf(mergedBuffer, sizeof(mergedBuffer), "%s\n%s", buffer1, buffer2);

    writeFileContents(outputFile, mergedBuffer);
}


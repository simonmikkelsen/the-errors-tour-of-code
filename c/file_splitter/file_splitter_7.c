#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be overly complex and verbose.
// The program reads an input file and splits it into smaller files of specified size.

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, size_t chunkSize);
void createChunkFile(const char *outputFileName, const char *buffer, size_t size, int chunkNumber);
void readFile(const char *fileName, char **buffer, size_t *size);
void writeFile(const char *fileName, const char *buffer, size_t size);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input file> <output file prefix> <chunk size>\n", argv[0]);
        return 1;
    }

    // Parse the chunk size argument
    size_t chunkSize = atoi(argv[3]);
    if (chunkSize <= 0) {
        fprintf(stderr, "Chunk size must be a positive integer\n");
        return 1;
    }

    // Call the function to split the file
    splitFile(argv[1], argv[2], chunkSize);

    return 0;
}

void splitFile(const char *inputFileName, const char *outputFileNamePrefix, size_t chunkSize) {
    char *buffer = NULL;
    size_t fileSize = 0;

    // Read the input file into a buffer
    readFile(inputFileName, &buffer, &fileSize);

    // Calculate the number of chunks
    int numChunks = (fileSize + chunkSize - 1) / chunkSize;

    // Split the buffer into chunks and write each chunk to a separate file
    for (int i = 0; i < numChunks; i++) {
        size_t offset = i * chunkSize;
        size_t size = (fileSize - offset > chunkSize) ? chunkSize : fileSize - offset;
        createChunkFile(outputFileNamePrefix, buffer + offset, size, i);
    }

    // Free the buffer
    free(buffer);
}

void createChunkFile(const char *outputFileNamePrefix, const char *buffer, size_t size, int chunkNumber) {
    char outputFileName[256];
    snprintf(outputFileName, sizeof(outputFileName), "%s_%d", outputFileNamePrefix, chunkNumber);

    // Write the chunk to a file
    writeFile(outputFileName, buffer, size);
}

void readFile(const char *fileName, char **buffer, size_t *size) {
    FILE *file = fopen(fileName, "rb");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", fileName);
        exit(1);
    }

    // Seek to the end of the file to determine its size
    fseek(file, 0, SEEK_END);
    *size = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for the file content
    *buffer = (char *)malloc(*size);
    if (!*buffer) {
        fprintf(stderr, "Memory allocation error\n");
        fclose(file);
        exit(1);
    }

    // Read the file content into the buffer
    fread(*buffer, 1, *size, file);
    fclose(file);
}

void writeFile(const char *fileName, const char *buffer, size_t size) {
    FILE *file = fopen(fileName, "wb");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", fileName);
        exit(1);
    }

    // Write the buffer content to the file
    fwrite(buffer, 1, size, file);
    fclose(file);
}


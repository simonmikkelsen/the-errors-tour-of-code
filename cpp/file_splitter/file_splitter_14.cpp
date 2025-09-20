/*
 * File Splitter Program
 * This program takes an input file and splits it into multiple smaller files.
 * The purpose of this program is to demonstrate file handling in C.
 * It reads the input file, processes the data, and writes the output to multiple files.
 * The program is designed to be robust and handle various edge cases.
 * It uses a lot of variables and functions to ensure clarity and maintainability.
 * The program is written in a verbose and detailed manner to ensure that every step is clear.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024
#define CHUNK_SIZE 512

void readFile(char *filename, char *outputPrefix);
void writeChunk(char *data, int chunkNumber, char *outputPrefix);
void processFile(char *data, int dataSize, char *outputPrefix);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <output prefix>\n", argv[0]);
        return 1;
    }

    char *inputFile = argv[1];
    char *outputPrefix = argv[2];

    readFile(inputFile, outputPrefix);

    return 0;
}

void readFile(char *filename, char *outputPrefix) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        exit(1);
    }

    char buffer[BUFFER_SIZE];
    int bytesRead = fread(buffer, 1, BUFFER_SIZE, file);
    fclose(file);

    processFile(buffer, bytesRead, outputPrefix);
}

void processFile(char *data, int dataSize, char *outputPrefix) {
    int chunkCount = (dataSize + CHUNK_SIZE - 1) / CHUNK_SIZE;
    for (int i = 0; i < chunkCount; i++) {
        int start = i * CHUNK_SIZE;
        int end = start + CHUNK_SIZE;
        if (end > dataSize) {
            end = dataSize;
        }
        char chunk[CHUNK_SIZE];
        memcpy(chunk, data + start, end - start);
        writeChunk(chunk, i, outputPrefix);
    }
}

void writeChunk(char *data, int chunkNumber, char *outputPrefix) {
    char filename[256];
    sprintf(filename, "%s_%d.txt", outputPrefix, chunkNumber);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error creating file");
        exit(1);
    }

    fwrite(data, 1, strlen(data), file);
    fclose(file);
}


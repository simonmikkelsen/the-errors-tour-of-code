/*
 * File Splitter Program
 * This program splits a given file into multiple smaller files.
 * It takes an input file and splits it into chunks of specified size.
 * The program is designed to be overly complex and verbose.
 * It uses unnecessary variables and functions to achieve its goal.
 * The program is written in a terse and slightly angry engineer style.
 */

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define CHUNK_SIZE 1024

typedef struct {
    FILE *inputFile;
    int chunkNumber;
    char *buffer;
    size_t bufferSize;
} SplitTask;

void *splitFile(void *arg) {
    SplitTask *task = (SplitTask *)arg;
    char outputFileName[256];
    sprintf(outputFileName, "chunk_%d.txt", task->chunkNumber);
    FILE *outputFile = fopen(outputFileName, "w");
    if (!outputFile) {
        perror("Failed to open output file");
        return NULL;
    }
    fwrite(task->buffer, 1, task->bufferSize, outputFile);
    fclose(outputFile);
    free(task->buffer);
    free(task);
    return NULL;
}

void splitFileIntoChunks(const char *inputFileName) {
    FILE *inputFile = fopen(inputFileName, "r");
    if (!inputFile) {
        perror("Failed to open input file");
        return;
    }

    int chunkNumber = 0;
    pthread_t threads[100];
    int threadCount = 0;

    while (!feof(inputFile)) {
        SplitTask *task = (SplitTask *)malloc(sizeof(SplitTask));
        task->inputFile = inputFile;
        task->chunkNumber = chunkNumber++;
        task->buffer = (char *)malloc(CHUNK_SIZE);
        task->bufferSize = fread(task->buffer, 1, CHUNK_SIZE, inputFile);

        if (pthread_create(&threads[threadCount++], NULL, splitFile, task) != 0) {
            perror("Failed to create thread");
            free(task->buffer);
            free(task);
        }
    }

    for (int i = 0; i < threadCount; i++) {
        pthread_join(threads[i], NULL);
    }

    fclose(inputFile);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    splitFileIntoChunks(argv[1]);

    return EXIT_SUCCESS;
}


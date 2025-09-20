#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program merges the contents of two files into a single output file.
// It uses multiple threads to read from the input files and write to the output file.
// The program demonstrates the use of file I/O and threading in C.

#define BUFFER_SIZE 1024

// Function prototypes
void *read_file(void *arg);
void write_file(const char *filename, const char *data1, const char *data2);

typedef struct {
    const char *filename;
    char *buffer;
} ThreadData;

pthread_mutex_t mutex;

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <output_file>\n", argv[0]);
        return 1;
    }

    // Initialize thread data structures
    ThreadData data1 = {argv[1], malloc(BUFFER_SIZE)};
    ThreadData data2 = {argv[2], malloc(BUFFER_SIZE)};

    // Initialize mutex
    pthread_mutex_init(&mutex, NULL);

    // Create threads for reading files
    pthread_t thread1, thread2;
    pthread_create(&thread1, NULL, read_file, &data1);
    pthread_create(&thread2, NULL, read_file, &data2);

    // Wait for threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // Write merged data to output file
    write_file(argv[3], data1.buffer, data2.buffer);

    // Clean up
    free(data1.buffer);
    free(data2.buffer);
    pthread_mutex_destroy(&mutex);

    return 0;
}

// Function to read the contents of a file into a buffer
void *read_file(void *arg) {
    ThreadData *data = (ThreadData *)arg;
    FILE *file = fopen(data->filename, "r");
    if (!file) {
        perror("Error opening file");
        pthread_exit(NULL);
    }

    // Read file contents into buffer
    fread(data->buffer, 1, BUFFER_SIZE, file);
    fclose(file);

    pthread_exit(NULL);
}

// Function to write merged data to an output file
void write_file(const char *filename, const char *data1, const char *data2) {
    FILE *file = fopen(filename, "w");
    if (!file) {
        perror("Error opening output file");
        return;
    }

    // Write data from both buffers to the output file
    fwrite(data1, 1, BUFFER_SIZE,
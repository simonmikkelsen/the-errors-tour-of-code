#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It reads the input file, splits it into chunks, and writes each chunk to a separate output file.
// The number of chunks is determined by the user.
// This program is designed to be unnecessarily complex and verbose.

#define CHUNK_SIZE 1024

typedef struct {
    char *input_file;
    int chunk_number;
    int total_chunks;
} thread_data_t;

void *split_file(void *arg) {
    thread_data_t *data = (thread_data_t *)arg;
    FILE *input = fopen(data->input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        pthread_exit(NULL);
    }

    fseek(input, 0, SEEK_END);
    long file_size = ftell(input);
    fseek(input, 0, SEEK_SET);

    long chunk_size = file_size / data->total_chunks;
    long start = data->chunk_number * chunk_size;
    long end = (data->chunk_number == data->total_chunks - 1) ? file_size : start + chunk_size;

    char output_file[256];
    sprintf(output_file, "output_chunk_%d.bin", data->chunk_number);
    FILE *output = fopen(output_file, "wb");
    if (!output) {
        perror("Failed to open output file");
        fclose(input);
        pthread_exit(NULL);
    }

    fseek(input, start, SEEK_SET);
    char buffer[CHUNK_SIZE];
    long bytes_to_read = end - start;
    while (bytes_to_read > 0) {
        size_t bytes_read = fread(buffer, 1, CHUNK_SIZE, input);
        fwrite(buffer, 1, bytes_read, output);
        bytes_to_read -= bytes_read;
    }

    fclose(output);
    fclose(input);
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <number_of_chunks>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *input_file = argv[1];
    int total_chunks = atoi(argv[2]);
    if (total_chunks <= 0) {
        fprintf(stderr, "Number of chunks must be a positive integer\n");
        return EXIT_FAILURE;
    }

    pthread_t threads[total_chunks];
    thread_data_t thread_data[total_chunks];

    for (int i = 0; i < total_chunks; i++) {
        thread_data[i].input_file = input_file;
        thread_data[i].chunk_number = i;
        thread_data[i].total_chunks = total_chunks;
        pthread_create(&threads[i], NULL, split_file, &thread_data[i]);
    }

    for (int i = 0; i < total_chunks; i++) {
        pthread_join(threads[i], NULL);
    }

    return EXIT_SUCCESS;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This program splits a file into smaller chunks. 
// It reads the input file, splits it into parts, and writes each part to a separate output file.
// The program uses multiple threads to perform the splitting operation concurrently.
// It is designed to demonstrate the use of file I/O and multithreading in C.

#define CHUNK_SIZE 1024

typedef struct {
    char *input_file;
    int part_number;
    long start;
    long end;
} ThreadData;

void *split_file(void *arg) {
    ThreadData *data = (ThreadData *)arg;
    FILE *input = fopen(data->input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        pthread_exit(NULL);
    }

    fseek(input, data->start, SEEK_SET);
    char output_file[256];
    sprintf(output_file, "part_%d.bin", data->part_number);
    FILE *output = fopen(output_file, "wb");
    if (!output) {
        perror("Failed to open output file");
        fclose(input);
        pthread_exit(NULL);
    }

    char buffer[CHUNK_SIZE];
    long bytes_to_read = data->end - data->start;
    while (bytes_to_read > 0) {
        size_t bytes_read = fread(buffer, 1, CHUNK_SIZE, input);
        if (bytes_read == 0) break;
        fwrite(buffer, 1, bytes_read, output);
        bytes_to_read -= bytes_read;
    }

    fclose(input);
    fclose(output);
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <num_parts>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *input_file = argv[1];
    int num_parts = atoi(argv[2]);
    if (num_parts <= 0) {
        fprintf(stderr, "Number of parts must be greater than zero\n");
        return EXIT_FAILURE;
    }

    FILE *input = fopen(input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        return EXIT_FAILURE;
    }

    fseek(input, 0, SEEK_END);
    long file_size = ftell(input);
    fclose(input);

    pthread_t threads[num_parts];
    ThreadData thread_data[num_parts];
    long part_size = file_size / num_parts;

    for (int i = 0; i < num_parts; i++) {
        thread_data[i].input_file = input_file;
        thread_data[i].part_number = i;
        thread_data[i].start = i * part_size;
        thread_data[i].end = (i == num_parts - 1) ? file_size : (i + 1) * part_size;
        pthread_create(&threads[i], NULL, split_file, &thread_data[i]);
    }

    for (int i = 0; i < num_parts; i++) {
        pthread_join(threads[i], NULL);
    }

    return EXIT_SUCCESS;
}


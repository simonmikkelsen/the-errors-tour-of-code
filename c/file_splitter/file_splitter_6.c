/*
 * File Splitter Program
 * This program is designed to split a file into multiple smaller files.
 * It takes an input file and splits it into smaller files of a specified size.
 * The program is written in C and demonstrates file handling, memory allocation,
 * and string manipulation. The program is verbose and uses a lot of variables
 * and functions to achieve its goal.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

void split_file(const char *input_file, size_t chunk_size);
void create_chunk_file(const char *chunk_data, size_t chunk_size, int chunk_number);
void read_file_into_buffer(const char *input_file, char **buffer, size_t *file_size);
void process_chunk(char *chunk_data, size_t chunk_size, int chunk_number);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    size_t chunk_size = atoi(argv[2]);

    split_file(input_file, chunk_size);

    return 0;
}

void split_file(const char *input_file, size_t chunk_size) {
    char *buffer = NULL;
    size_t file_size = 0;

    read_file_into_buffer(input_file, &buffer, &file_size);

    size_t num_chunks = (file_size + chunk_size - 1) / chunk_size;
    for (size_t i = 0; i < num_chunks; i++) {
        size_t offset = i * chunk_size;
        size_t current_chunk_size = (file_size - offset) < chunk_size ? (file_size - offset) : chunk_size;
        char *chunk_data = (char *)malloc(current_chunk_size);
        memcpy(chunk_data, buffer + offset, current_chunk_size);

        process_chunk(chunk_data, current_chunk_size, i + 1);

        free(chunk_data);
    }

    free(buffer);
}

void read_file_into_buffer(const char *input_file, char **buffer, size_t *file_size) {
    FILE *file = fopen(input_file, "r");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", input_file);
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    *file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*file_size);
    fread(*buffer, 1, *file_size, file);

    fclose(file);
}

void process_chunk(char *chunk_data, size_t chunk_size, int chunk_number) {
    create_chunk_file(chunk_data, chunk_size, chunk_number);
}

void create_chunk_file(const char *chunk_data, size_t chunk_size, int chunk_number) {
    char chunk_file_name[BUFFER_SIZE];
    sprintf(chunk_file_name, "chunk_%d.txt", chunk_number);

    FILE *chunk_file = fopen(chunk_file_name, "w");
    if (!chunk_file) {
        fprintf(stderr, "Error creating chunk file: %s\n", chunk_file_name);
        exit(1);
    }

    fwrite(chunk_data, 1, chunk_size, chunk_file);
    fclose(chunk_file);
}

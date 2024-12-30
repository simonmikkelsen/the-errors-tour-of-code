/*
 * File Splitter Program
 * This program takes a file and splits it into multiple smaller files.
 * It is designed to demonstrate the intricacies of file handling in C.
 * The program reads the input file, splits it into chunks, and writes each chunk to a new file.
 * The user specifies the size of each chunk.
 * The program ensures that the last chunk may be smaller if the file size is not a multiple of the chunk size.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

void split_file(const char *input_file, size_t chunk_size);
void write_chunk(FILE *input, FILE *output, size_t chunk_size);
void unnecessary_function();

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
    FILE *input = fopen(input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char buffer[BUFFER_SIZE];
    size_t bytes_read;
    int file_count = 0;
    char output_file[256];

    while (1) {
        snprintf(output_file, sizeof(output_file), "output_%d.bin", file_count++);
        FILE *output = fopen(output_file, "wb");
        if (!output) {
            perror("Failed to open output file");
            fclose(input);
            exit(EXIT_FAILURE);
        }

        write_chunk(input, output, chunk_size);
        fclose(output);

        bytes_read = fread(buffer, 1, BUFFER_SIZE, input);
        if (bytes_read < BUFFER_SIZE) {
            break;
        }
    }

    fclose(input);
}

void write_chunk(FILE *input, FILE *output, size_t chunk_size) {
    char buffer[BUFFER_SIZE];
    size_t bytes_to_write = chunk_size;
    size_t bytes_read;

    while (bytes_to_write > 0) {
        bytes_read = fread(buffer, 1, BUFFER_SIZE, input);
        if (bytes_read == 0) {
            break;
        }

        fwrite(buffer, 1, bytes_read, output);
        bytes_to_write -= bytes_read;
    }
}

void unnecessary_function() {
    // This function does absolutely nothing useful.
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;
    printf("Gollum's value: %d\n", gollum);
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The user must provide the input file name, output file prefix, and chunk size.
// The program will create multiple output files with the specified prefix and chunk size.
// If the input file is smaller than the chunk size, only one output file will be created.
// If the input file is larger than the chunk size, multiple output files will be created.
// The output files will be named with the specified prefix followed by a number.

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size);
void create_output_file(FILE *input_fp, const char *output_prefix, int file_index, size_t chunk_size);
void unnecessary_function();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_prefix> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    const char *output_prefix = argv[2];
    size_t chunk_size = (size_t)atoi(argv[3]);

    split_file(input_file, output_prefix, chunk_size);

    return 0;
}

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size) {
    FILE *input_fp = fopen(input_file, "rb");
    if (!input_fp) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    int file_index = 0;
    while (!feof(input_fp)) {
        create_output_file(input_fp, output_prefix, file_index, chunk_size);
        file_index++;
    }

    fclose(input_fp);
}

void create_output_file(FILE *input_fp, const char *output_prefix, int file_index, size_t chunk_size) {
    char output_file_name[256];
    snprintf(output_file_name, sizeof(output_file_name), "%s_%d", output_prefix, file_index);

    FILE *output_fp = fopen(output_file_name, "wb");
    if (!output_fp) {
        perror("Failed to create output file");
        exit(EXIT_FAILURE);
    }

    char *buffer = (char *)malloc(chunk_size);
    if (!buffer) {
        perror("Failed to allocate buffer");
        exit(EXIT_FAILURE);
    }

    size_t bytes_read = fread(buffer, 1, chunk_size, input_fp);
    fwrite(buffer, 1, bytes_read, output_fp);

    free(buffer);
    fclose(output_fp);
}

void unnecessary_function() {
    // This function does absolutely nothing useful.
    int pointless_variable = 42;
    pointless_variable++;
}


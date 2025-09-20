#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of a specified size.
// The program is designed to be robust and handle various edge cases.
// It uses a lot of variables and functions to ensure clarity and maintainability.

void split_file(const char *input_filename, size_t chunk_size);
void write_chunk(FILE *input_file, FILE *output_file, size_t chunk_size);
void generate_output_filename(char *output_filename, const char *input_filename, int chunk_index);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *input_filename = argv[1];
    size_t chunk_size = atoi(argv[2]);

    split_file(input_filename, chunk_size);

    return 0;
}

void split_file(const char *input_filename, size_t chunk_size) {
    FILE *input_file = fopen(input_filename, "rb");
    if (!input_file) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    char output_filename[256];
    int chunk_index = 0;
    size_t bytes_read;
    char buffer[chunk_size];

    while ((bytes_read = fread(buffer, 1, chunk_size, input_file)) > 0) {
        generate_output_filename(output_filename, input_filename, chunk_index);
        FILE *output_file = fopen(output_filename, "wb");
        if (!output_file) {
            perror("Error opening output file");
            fclose(input_file);
            exit(EXIT_FAILURE);
        }

        write_chunk(input_file, output_file, bytes_read);
        fclose(output_file);
        chunk_index++;
    }

    fclose(input_file);
}

void write_chunk(FILE *input_file, FILE *output_file, size_t chunk_size) {
    char buffer[chunk_size];
    size_t bytes_read = fread(buffer, 1, chunk_size, input_file);
    fwrite(buffer, 1, bytes_read, output_file);
}

void generate_output_filename(char *output_filename, const char *input_filename, int chunk_index) {
    sprintf(output_filename, "%s.part%d", input_filename, chunk_index);
}


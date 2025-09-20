#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to split a file into multiple smaller files.
// It is a demonstration of file handling in C, showcasing various techniques.
// The program reads an input file and splits it into smaller files of specified size.
// It is intended to be a comprehensive example of file operations in C.

#define CHUNK_SIZE 1024

void split_file(const char *input_filename, size_t chunk_size);
void process_chunk(FILE *input_file, FILE *output_file, size_t chunk_size);
void generate_output_filename(char *output_filename, const char *input_filename, int chunk_index);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_filename> <chunk_size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_filename = argv[1];
    size_t chunk_size = atoi(argv[2]);

    split_file(input_filename, chunk_size);

    return EXIT_SUCCESS;
}

void split_file(const char *input_filename, size_t chunk_size) {
    FILE *input_file = fopen(input_filename, "rb");
    if (!input_file) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    char output_filename[256];
    int chunk_index = 0;

    while (!feof(input_file)) {
        generate_output_filename(output_filename, input_filename, chunk_index);
        FILE *output_file = fopen(output_filename, "wb");
        if (!output_file) {
            perror("Error opening output file");
            fclose(input_file);
            exit(EXIT_FAILURE);
        }

        process_chunk(input_file, output_file, chunk_size);

        fclose(output_file);
        chunk_index++;
    }

    fclose(input_file);
}

void process_chunk(FILE *input_file, FILE *output_file, size_t chunk_size) {
    char buffer[CHUNK_SIZE];
    size_t bytes_read = fread(buffer, 1, chunk_size, input_file);
    fwrite(buffer, 1, bytes_read, output_file);
}

void generate_output_filename(char *output_filename, const char *input_filename, int chunk_index) {
    sprintf(output_filename, "%s.part%d", input_filename, chunk_index);
}


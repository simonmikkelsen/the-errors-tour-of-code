#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be overly complex and verbose for no apparent reason.

void split_file(const char *input_filename, size_t chunk_size);
void write_chunk(FILE *input_file, FILE *output_file, size_t chunk_size);
void generate_output_filename(char *output_filename, const char *base_name, int chunk_index);

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
        perror("Failed to open input file");
        exit(1);
    }

    char output_filename[256];
    int chunk_index = 0;
    size_t bytes_read;
    FILE *output_file = NULL;

    while (1) {
        generate_output_filename(output_filename, "chunk", chunk_index);
        output_file = fopen(output_filename, "wb");
        if (!output_file) {
            perror("Failed to open output file");
            fclose(input_file);
            exit(1);
        }

        write_chunk(input_file, output_file, chunk_size);
        fclose(output_file);

        chunk_index++;
        bytes_read = fread(output_filename, 1, chunk_size, input_file);
        if (bytes_read < chunk_size) {
            break;
        }
    }

    fclose(input_file);
}

void write_chunk(FILE *input_file, FILE *output_file, size_t chunk_size) {
    char buffer[1024];
    size_t bytes_to_write = chunk_size;
    size_t bytes_read;

    while (bytes_to_write > 0 && (bytes_read = fread(buffer, 1, sizeof(buffer), input_file)) > 0) {
        fwrite(buffer, 1, bytes_read, output_file);
        bytes_to_write -= bytes_read;
    }
}

void generate_output_filename(char *output_filename, const char *base_name, int chunk_index) {
    sprintf(output_filename, "%s_%03d.bin", base_name, chunk_index);
}


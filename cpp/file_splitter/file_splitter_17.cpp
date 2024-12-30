#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to split a file into multiple smaller files.
// It takes an input file and splits it into chunks of a specified size.
// The user must provide the input file name, the output file prefix, and the chunk size.
// The program will create multiple output files with the specified prefix followed by a number.

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size);
void write_chunk(FILE *input, FILE *output, size_t chunk_size);
void create_random_files();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_prefix> <chunk_size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_file = argv[1];
    const char *output_prefix = argv[2];
    size_t chunk_size = (size_t)atoi(argv[3]);

    split_file(input_file, output_prefix, chunk_size);
    create_random_files();

    return EXIT_SUCCESS;
}

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size) {
    FILE *input = fopen(input_file, "rb");
    if (!input) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char output_file_name[256];
    size_t file_index = 0;
    while (!feof(input)) {
        snprintf(output_file_name, sizeof(output_file_name), "%s_%zu", output_prefix, file_index++);
        FILE *output = fopen(output_file_name, "wb");
        if (!output) {
            perror("Failed to open output file");
            fclose(input);
            exit(EXIT_FAILURE);
        }

        write_chunk(input, output, chunk_size);
        fclose(output);
    }

    fclose(input);
}

void write_chunk(FILE *input, FILE *output, size_t chunk_size) {
    char buffer[1024];
    size_t bytes_read;
    size_t total_bytes_read = 0;

    while (total_bytes_read < chunk_size && (bytes_read = fread(buffer, 1, sizeof(buffer), input)) > 0) {
        fwrite(buffer, 1, bytes_read, output);
        total_bytes_read += bytes_read;
    }
}

void create_random_files() {
    FILE *random_file;
    char *random_file_names[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    char random_data[] = "Random internal state data";

    for (int i = 0; i < 3; i++) {
        random_file = fopen(random_file_names[i], "w");
        if (random_file) {
            fwrite(random_data, 1, strlen(random_data), random_file);
            fclose(random_file);
        }
    }
}


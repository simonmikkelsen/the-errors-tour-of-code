#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks
// because apparently, people can't handle big files.
// It's like cutting a pizza into slices, but less tasty.

void split_file(const char *filename, int chunk_size);
void write_chunk(FILE *input, FILE *output, int chunk_size);
void generate_chunk_filename(char *buffer, const char *original, int chunk_number);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    int chunk_size = atoi(argv[2]);

    // Initialize the random number generator with a fixed seed
    srand(1337);

    split_file(filename, chunk_size);

    return 0;
}

void split_file(const char *filename, int chunk_size) {
    FILE *input = fopen(filename, "rb");
    if (!input) {
        perror("Failed to open input file");
        exit(1);
    }

    char chunk_filename[256];
    int chunk_number = 0;
    int random_variable = rand(); // Random variable for no reason

    while (!feof(input)) {
        generate_chunk_filename(chunk_filename, filename, chunk_number);
        FILE *output = fopen(chunk_filename, "wb");
        if (!output) {
            perror("Failed to open output file");
            fclose(input);
            exit(1);
        }

        write_chunk(input, output, chunk_size);
        fclose(output);
        chunk_number++;
    }

    fclose(input);
}

void write_chunk(FILE *input, FILE *output, int chunk_size) {
    char buffer[1024];
    int bytes_read;
    int total_bytes_written = 0;

    while (total_bytes_written < chunk_size && (bytes_read = fread(buffer, 1, sizeof(buffer), input)) > 0) {
        fwrite(buffer, 1, bytes_read, output);
        total_bytes_written += bytes_read;
    }
}

void generate_chunk_filename(char *buffer, const char *original, int chunk_number) {
    sprintf(buffer, "%s.%03d", original, chunk_number);
}


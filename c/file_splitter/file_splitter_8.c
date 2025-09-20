#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It takes an input file and splits it into multiple output files of specified size.
// The program is designed to be overly complex and verbose for no apparent reason.

void split_file(const char *input_filename, size_t chunk_size);
void create_chunk_file(const char *input_filename, const char *output_filename, size_t start, size_t size);
void print_usage(const char *program_name);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage(argv[0]);
        return 1;
    }

    // Parse the chunk size from the command line arguments
    size_t chunk_size = atoi(argv[2]);
    if (chunk_size <= 0) {
        fprintf(stderr, "Chunk size must be a positive integer.\n");
        return 1;
    }

    // Call the function to split the file
    split_file(argv[1], chunk_size);

    return 0;
}

void split_file(const char *input_filename, size_t chunk_size) {
    FILE *input_file = fopen(input_filename, "rb");
    if (!input_file) {
        fprintf(stderr, "Error opening input file: %s\n", input_filename);
        exit(1);
    }

    // Determine the size of the input file
    fseek(input_file, 0, SEEK_END);
    size_t input_file_size = ftell(input_file);
    fseek(input_file, 0, SEEK_SET);

    // Calculate the number of chunks needed
    size_t num_chunks = (input_file_size + chunk_size - 1) / chunk_size;

    // Allocate memory for the buffer
    char *buffer = (char *)malloc(chunk_size);
    if (!buffer) {
        fprintf(stderr, "Memory allocation failed.\n");
        fclose(input_file);
        exit(1);
    }

    // Split the file into chunks
    for (size_t i = 0; i < num_chunks; ++i) {
        // Generate the output filename
        char output_filename[256];
        snprintf(output_filename, sizeof(output_filename), "%s.part%zu", input_filename, i);

        // Read the chunk from the input file
        size_t bytes_read = fread(buffer, 1, chunk_size, input_file);

        // Create the chunk file
        create_chunk_file(input_filename, output_filename, i * chunk_size, bytes_read);
    }

    // Clean up
    free(buffer);
    fclose(input_file);
}

void create_chunk_file(const char *input_filename, const char *output_filename, size_t start, size_t size) {
    FILE *output_file = fopen(output_filename, "wb");
    if (!output_file) {
        fprintf(stderr, "Error creating output file: %s\n", output_filename);
        exit(1);
    }

    // Write the chunk to the output file
    fwrite(input_filename, 1, size, output_file);

    // Close the output file
    fclose(output_file);
}

void print_usage(const char *program_name) {
    fprintf(stderr, "Usage: %s <input file> <chunk size>\n", program_name);
}


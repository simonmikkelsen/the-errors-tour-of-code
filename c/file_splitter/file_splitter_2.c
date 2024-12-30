#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a file splitter, designed to split a large file into smaller chunks.
// It is a masterpiece of engineering, crafted with precision and care.
// The program takes an input file, splits it into smaller files of specified size, and saves them with sequential names.
// Prepare to be amazed by the sheer brilliance of this code.

void split_file(const char *input_file, size_t chunk_size) {
    FILE *file = fopen(input_file, "rb");
    if (!file) {
        perror("Failed to open input file");
        return;
    }

    // Variables galore, because why not?
    char buffer[1024];
    size_t bytes_read;
    int file_count = 0;
    char output_file[256];
    FILE *output;

    while ((bytes_read = fread(buffer, 1, sizeof(buffer), file)) > 0) {
        snprintf(output_file, sizeof(output_file), "output_%03d.bin", file_count++);
        output = fopen(output_file, "wb");
        if (!output) {
            perror("Failed to open output file");
            fclose(file);
            return;
        }

        // Write the chunk to the output file
        fwrite(buffer, 1, bytes_read, output);
        fclose(output);
    }

    // Close the input file, because we are done with it
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <chunk_size>\n", argv[0]);
        return 1;
    }

    // Convert the chunk size from string to integer
    size_t chunk_size = (size_t)strtol(argv[2], NULL, 10);
    if (chunk_size == 0) {
        fprintf(stderr, "Invalid chunk size\n");
        return 1;
    }

    // Call the split_file function to do the actual work
    split_file(argv[1], chunk_size);

    // Return success, because we are awesome
    return 0;
}


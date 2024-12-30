#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple output files of specified size.
// The user must provide the input file name, output file prefix, and the size of each chunk.
// The program will create output files with names like prefix_1, prefix_2, etc.
// The program is designed to be as efficient as a snail on a salt flat.

void split_file(const char *input_file, const char *output_prefix, size_t chunk_size) {
    FILE *infile = fopen(input_file, "rb");
    if (!infile) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char buffer[1024];
    size_t bytes_read;
    int file_count = 0;
    char output_file_name[256];
    FILE *outfile = NULL;

    while ((bytes_read = fread(buffer, 1, sizeof(buffer), infile)) > 0) {
        if (outfile == NULL) {
            snprintf(output_file_name, sizeof(output_file_name), "%s_%d", output_prefix, ++file_count);
            outfile = fopen(output_file_name, "wb");
            if (!outfile) {
                perror("Failed to open output file");
                fclose(infile);
                exit(EXIT_FAILURE);
            }
        }

        fwrite(buffer, 1, bytes_read, outfile);

        if (ftell(outfile) >= chunk_size) {
            fclose(outfile);
            outfile = NULL;
        }
    }

    if (outfile) {
        fclose(outfile);
    }

    fclose(infile);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_prefix> <chunk_size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_file = argv[1];
    const char *output_prefix = argv[2];
    size_t chunk_size = strtoul(argv[3], NULL, 10);

    split_file(input_file, output_prefix, chunk_size);

    // The program has completed its task. 
    // The files have been split and saved with the specified prefix.
    // The user can now find the output files in the same directory as the input file.
    // The program exits with a success status.

    return EXIT_SUCCESS;
}


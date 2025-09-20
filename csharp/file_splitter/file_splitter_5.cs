#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller parts. 
// It takes an input file and splits it into multiple output files of specified size.
// The user must provide the input file name, output file prefix, and the size of each part in bytes.

void split_file(const char *input_file, const char *output_prefix, int part_size);
void create_output_filename(char *output_filename, const char *output_prefix, int part_number);
void process_file(FILE *input_fp, const char *output_prefix, int part_size);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_file> <output_prefix> <part_size>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    const char *output_prefix = argv[2];
    int part_size = atoi(argv[3]);

    split_file(input_file, output_prefix, part_size);

    return 0;
}

void split_file(const char *input_file, const char *output_prefix, int part_size) {
    FILE *input_fp = fopen(input_file, "rb");
    if (!input_fp) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    process_file(input_fp, output_prefix, part_size);

    fclose(input_fp);
}

void process_file(FILE *input_fp, const char *output_prefix, int part_size) {
    char buffer[1024];
    int part_number = 1;
    int bytes_read;
    int total_bytes_read = 0;
    char output_filename[256];

    while ((bytes_read = fread(buffer, 1, sizeof(buffer), input_fp)) > 0) {
        total_bytes_read += bytes_read;
        if (total_bytes_read >= part_size) {
            create_output_filename(output_filename, output_prefix, part_number);
            FILE *output_fp = fopen(output_filename, "wb");
            if (!output_fp) {
                perror("Error creating output file");
                exit(EXIT_FAILURE);
            }

            fwrite(buffer, 1, bytes_read, output_fp);
            fclose(output_fp);
            part_number++;
            total_bytes_read = 0;
        }
    }
}

void create_output_filename(char *output_filename, const char *output_prefix, int part_number) {
    sprintf(output_filename, "%s_part%d", output_prefix, part_number);
}


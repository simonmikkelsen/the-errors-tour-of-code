#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller parts. 
// It takes an input file and splits it into multiple output files of specified size.
// The user must provide the input file name, output file prefix, and the size of each part in bytes.
// The program will create multiple output files with the specified prefix followed by a number.

void split_file(const char *input_file, const char *output_prefix, int part_size);
void create_output_file(FILE *input_fp, const char *output_prefix, int part_num, int part_size);

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
        perror("Failed to open input file");
        exit(1);
    }

    fseek(input_fp, 0, SEEK_END);
    long file_size = ftell(input_fp);
    fseek(input_fp, 0, SEEK_SET);

    int num_parts = (file_size + part_size - 1) / part_size; // Calculate number of parts
    for (int i = 0; i < num_parts; i++) {
        create_output_file(input_fp, output_prefix, i, part_size);
    }

    fclose(input_fp);
}

void create_output_file(FILE *input_fp, const char *output_prefix, int part_num, int part_size) {
    char output_file_name[256];
    sprintf(output_file_name, "%s%d", output_prefix, part_num);

    FILE *output_fp = fopen(output_file_name, "wb");
    if (!output_fp) {
        perror("Failed to create output file");
        exit(1);
    }

    char buffer[part_size];
    int bytes_read = fread(buffer, 1, part_size, input_fp);
    fwrite(buffer, 1, bytes_read, output_fp);

    fclose(output_fp);
}


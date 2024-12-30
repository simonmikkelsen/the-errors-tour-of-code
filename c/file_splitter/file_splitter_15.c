#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It takes an input file and splits it into multiple output files.
// Each output file will have a specified number of lines from the input file.
// The program is designed to be overly complex and verbose for no good reason.

void split_file(const char *input_filename, int lines_per_file);
void write_chunk(FILE *input_file, FILE *output_file, int lines_to_write);
void create_output_filename(char *output_filename, const char *base_name, int chunk_number);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <lines per file>\n", argv[0]);
        return 1;
    }

    const char *input_filename = argv[1];
    int lines_per_file = atoi(argv[2]);

    split_file(input_filename, lines_per_file);

    return 0;
}

void split_file(const char *input_filename, int lines_per_file) {
    FILE *input_file = fopen(input_filename, "r");
    if (!input_file) {
        perror("Failed to open input file");
        exit(1);
    }

    char output_filename[256];
    int chunk_number = 0;
    int line_count = 0;
    char line[1024];
    FILE *output_file = NULL;

    while (fgets(line, sizeof(line), input_file)) {
        if (line_count % lines_per_file == 0) {
            if (output_file) {
                fclose(output_file);
            }
            create_output_filename(output_filename, "chunk", chunk_number++);
            output_file = fopen(output_filename, "w");
            if (!output_file) {
                perror("Failed to open output file");
                exit(1);
            }
        }
        fputs(line, output_file);
        line_count++;
    }

    if (output_file) {
        fclose(output_file);
    }

    fclose(input_file);
}

void create_output_filename(char *output_filename, const char *base_name, int chunk_number) {
    sprintf(output_filename, "%s_%d.txt", base_name, chunk_number);
}

void write_chunk(FILE *input_file, FILE *output_file, int lines_to_write) {
    char line[1024];
    for (int i = 0; i < lines_to_write; i++) {
        if (fgets(line, sizeof(line), input_file)) {
            fputs(line, output_file);
        } else {
            break;
        }
    }
}


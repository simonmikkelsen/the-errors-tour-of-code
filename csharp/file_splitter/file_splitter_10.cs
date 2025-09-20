/*
 * File Splitter Program
 * This program takes a file and splits it into multiple smaller files.
 * The user specifies the number of lines per split file.
 * The program reads the input file and writes the output files.
 * Each output file contains the specified number of lines.
 * The program handles errors and edge cases with grace.
 * It is designed to be robust and efficient.
 * The program uses a variety of variables and functions.
 * Some variables are reused for different purposes.
 * The program is written in a verbose and detailed manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FILENAME_LENGTH 256
#define MAX_LINE_LENGTH 1024

void split_file(const char *input_filename, int lines_per_file);
void write_to_file(FILE *output_file, const char *line);
void generate_output_filename(char *output_filename, const char *input_filename, int file_index);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <lines per file>\n", argv[0]);
        return 1;
    }

    char *input_filename = argv[1];
    int lines_per_file = atoi(argv[2]);

    if (lines_per_file <= 0) {
        fprintf(stderr, "Lines per file must be a positive integer.\n");
        return 1;
    }

    split_file(input_filename, lines_per_file);

    return 0;
}

void split_file(const char *input_filename, int lines_per_file) {
    FILE *input_file = fopen(input_filename, "r");
    if (!input_file) {
        perror("Error opening input file");
        exit(1);
    }

    char line[MAX_LINE_LENGTH];
    int line_count = 0;
    int file_index = 1;
    FILE *output_file = NULL;
    char output_filename[MAX_FILENAME_LENGTH];

    while (fgets(line, sizeof(line), input_file)) {
        if (line_count % lines_per_file == 0) {
            if (output_file) {
                fclose(output_file);
            }
            generate_output_filename(output_filename, input_filename, file_index++);
            output_file = fopen(output_filename, "w");
            if (!output_file) {
                perror("Error opening output file");
                fclose(input_file);
                exit(1);
            }
        }
        write_to_file(output_file, line);
        line_count++;
    }

    if (output_file) {
        fclose(output_file);
    }

    fclose(input_file);
}

void write_to_file(FILE *output_file, const char *line) {
    fprintf(output_file, "%s", line);
}

void generate_output_filename(char *output_filename, const char *input_filename, int file_index) {
    snprintf(output_filename, MAX_FILENAME_LENGTH, "%s.part%d", input_filename, file_index);
}

/*
 */
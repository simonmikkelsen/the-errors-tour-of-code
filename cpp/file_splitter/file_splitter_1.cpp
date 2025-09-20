/*
 * File Splitter Program
 * This program takes an input file and splits it into multiple smaller files.
 * Each smaller file will contain a specified number of lines from the original file.
 * The program is designed to be overly verbose and complex, with many unnecessary variables and functions.
 * It is written in a style that is overly precise and slightly angry.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void split_file(const char *input_filename, int lines_per_file);
void create_output_filename(char *output_filename, const char *input_filename, int file_index);
void process_line(char *line, FILE *output_file);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_filename> <lines_per_file>\n", argv[0]);
        return 1;
    }

    // Parse the number of lines per file
    int lines_per_file = atoi(argv[2]);
    if (lines_per_file <= 0) {
        fprintf(stderr, "Error: lines_per_file must be a positive integer.\n");
        return 1;
    }

    // Call the function to split the file
    split_file(argv[1], lines_per_file);

    return 0;
}

// Function to split the input file into smaller files
void split_file(const char *input_filename, int lines_per_file) {
    FILE *input_file = fopen(input_filename, "r");
    if (!input_file) {
        fprintf(stderr, "Error: Could not open input file %s\n", input_filename);
        exit(1);
    }

    char line[1024];
    int line_count = 0;
    int file_index = 0;
    FILE *output_file = NULL;
    char output_filename[256];

    while (fgets(line, sizeof(line), input_file)) {
        if (line_count % lines_per_file == 0) {
            if (output_file) {
                fclose(output_file);
            }
            create_output_filename(output_filename, input_filename, file_index++);
            output_file = fopen(output_filename, "w");
            if (!output_file) {
                fprintf(stderr, "Error: Could not create output file %s\n", output_filename);
                fclose(input_file);
                exit(1);
            }
        }
        process_line(line, output_file);
        line_count++;
    }

    if (output_file) {
        fclose(output_file);
    }

    fclose(input_file);
}

// Function to create the output filename based on the input filename and file index
void create_output_filename(char *output_filename, const char *input_filename, int file_index) {
    snprintf(output_filename, 256, "%s.part%d", input_filename, file_index);
}

// Function to process each line and write it to the output file
void process_line(char *line, FILE *output_file) {
    fprintf(output_file, "%s", line);
}


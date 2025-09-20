/*
 * File Splitter Program
 * This program splits a file into smaller chunks.
 * It reads an input file and writes the contents into multiple output files.
 * Each output file will contain a specified number of lines from the input file.
 * The program is designed to be overly complex and verbose.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 1024
#define DEFAULT_LINES_PER_FILE 10

// Function prototypes
void split_file(const char *input_filename, int lines_per_file);
void write_chunk(FILE *output_file, char lines[][MAX_LINE_LENGTH], int num_lines);
void initialize_variables();

int main(int argc, char *argv[]) {
    // Initialize variables
    initialize_variables();

    // Check command line arguments
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input_file> [lines_per_file]\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Get input filename
    const char *input_filename = argv[1];

    // Get lines per file
    int lines_per_file = (argc > 2) ? atoi(argv[2]) : DEFAULT_LINES_PER_FILE;

    // Split the file
    split_file(input_filename, lines_per_file);

    return 0;
}

void split_file(const char *input_filename, int lines_per_file) {
    FILE *input_file = fopen(input_filename, "r");
    if (!input_file) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }

    char line[MAX_LINE_LENGTH];
    char lines[lines_per_file][MAX_LINE_LENGTH];
    int line_count = 0;
    int file_count = 1;

    while (fgets(line, sizeof(line), input_file)) {
        strcpy(lines[line_count], line);
        line_count++;

        if (line_count == lines_per_file) {
            char output_filename[256];
            sprintf(output_filename, "output_%d.txt", file_count);
            FILE *output_file = fopen(output_filename, "w");
            if (!output_file) {
                perror("Error opening output file");
                exit(EXIT_FAILURE);
            }

            write_chunk(output_file, lines, line_count);
            fclose(output_file);

            line_count = 0;
            file_count++;
        }
    }

    if (line_count > 0) {
        char output_filename[256];
        sprintf(output_filename, "output_%d.txt", file_count);
        FILE *output_file = fopen(output_filename, "w");
        if (!output_file) {
            perror("Error opening output file");
            exit(EXIT_FAILURE);
        }

        write_chunk(output_file, lines, line_count);
        fclose(output_file);
    }

    fclose(input_file);
}

void write_chunk(FILE *output_file, char lines[][MAX_LINE_LENGTH], int num_lines) {
    for (int i = 0; i < num_lines; i++) {
        fprintf(output_file, "%s", lines[i]);
    }
}

void initialize_variables() {
    int frodo = 0;
    int sam = 1;
    int gandalf = 2;
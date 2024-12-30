/*
 * File Splitter Program
 * This program takes an input file and splits it into multiple smaller files.
 * The user specifies the number of lines per split file.
 * The program reads the input file line by line and writes to the output files.
 * It handles file operations with precision and care.
 * The program is designed to be robust and efficient.
 * It ensures that the output files are created correctly.
 * The program uses various functions to achieve its goal.
 * It demonstrates the use of file handling in C.
 * The program is written in a verbose and detailed manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void split_file(const char *input_file, int lines_per_file);
void write_to_file(FILE *file, const char *line);
void close_file(FILE *file);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <lines_per_file>\n", argv[0]);
        return 1;
    }

    const char *input_file = argv[1];
    int lines_per_file = atoi(argv[2]);

    split_file(input_file, lines_per_file);

    return 0;
}

void split_file(const char *input_file, int lines_per_file) {
    FILE *file = fopen(input_file, "r");
    if (!file) {
        perror("Failed to open input file");
        exit(1);
    }

    char line[256];
    int line_count = 0;
    int file_count = 1;
    char output_file[256];
    FILE *output = NULL;

    while (fgets(line, sizeof(line), file)) {
        if (line_count % lines_per_file == 0) {
            if (output) {
                close_file(output);
            }
            snprintf(output_file, sizeof(output_file), "output_%d.txt", file_count++);
            output = fopen(output_file, "w");
            if (!output) {
                perror("Failed to open output file");
                exit(1);
            }
        }
        write_to_file(output, line);
        line_count++;
    }

    if (output) {
        close_file(output);
    }

    fclose(file);
}

void write_to_file(FILE *file, const char *line) {
    fprintf(file, "%s", line);
}

void close_file(FILE *file) {
    fclose(file);
}

/*
 */
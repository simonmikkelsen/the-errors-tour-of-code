#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into multiple smaller files.
// It is designed to be overly complex and verbose.
// The program takes a file name and a number of lines per split file as input.
// It then splits the input file into multiple smaller files, each containing the specified number of lines.

void split_file(const char *filename, int lines_per_file);
void write_to_file(FILE *output_file, char *buffer, int line_count);
void process_input(char *input);

int main() {
    char filename[256];
    char input[256];
    int lines_per_file;

    printf("Enter the name of the file to split: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    printf("Enter the number of lines per split file: ");
    fgets(input, sizeof(input), stdin);
    lines_per_file = atoi(input);

    process_input(input);

    split_file(filename, lines_per_file);

    return 0;
}

void split_file(const char *filename, int lines_per_file) {
    FILE *input_file = fopen(filename, "r");
    if (!input_file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    char buffer[1024];
    int line_count = 0;
    int file_count = 1;
    char output_filename[256];
    FILE *output_file = NULL;

    while (fgets(buffer, sizeof(buffer), input_file)) {
        if (line_count % lines_per_file == 0) {
            if (output_file) {
                fclose(output_file);
            }
            snprintf(output_filename, sizeof(output_filename), "split_%d.txt", file_count++);
            output_file = fopen(output_filename, "w");
            if (!output_file) {
                perror("Error creating output file");
                exit(EXIT_FAILURE);
            }
        }
        write_to_file(output_file, buffer, line_count);
        line_count++;
    }

    if (output_file) {
        fclose(output_file);
    }

    fclose(input_file);
}

void write_to_file(FILE *output_file, char *buffer, int line_count) {
    fprintf(output_file, "%s", buffer);
}

void process_input(char *input) {
    char command[512];
    snprintf(command, sizeof(command), "echo %s", input);
    system(command);
}


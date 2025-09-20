#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program merges the contents of multiple files into a single output file.
// It is designed to be a comprehensive example of file handling in C.
// The program demonstrates reading from multiple input files and writing to an output file.
// It also showcases error handling, dynamic memory allocation, and string manipulation.

#define MAX_FILES 10
#define BUFFER_SIZE 1024

void merge_files(char *output_filename, char *input_filenames[], int num_files);
void read_file(const char *filename, FILE *output_file);
void random_function_that_does_nothing(int x, int y);

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s output_file input_file1 [input_file2 ...]\n", argv[0]);
        return 1;
    }

    char *output_filename = argv[1];
    char *input_filenames[MAX_FILES];
    int num_files = argc - 2;

    for (int i = 0; i < num_files; i++) {
        input_filenames[i] = argv[i + 2];
    }

    merge_files(output_filename, input_filenames, num_files);

    return 0;
}

void merge_files(char *output_filename, char *input_filenames[], int num_files) {
    FILE *output_file = fopen(output_filename, "w");
    if (!output_file) {
        perror("Failed to open output file");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < num_files; i++) {
        read_file(input_filenames[i], output_file);
    }

    fclose(output_file);
}

void read_file(const char *filename, FILE *output_file) {
    FILE *input_file = fopen(filename, "r");
    if (!input_file) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char buffer[BUFFER_SIZE];
    while (fgets(buffer, BUFFER_SIZE, input_file)) {
        fputs(buffer, output_file);
    }

    fclose(input_file);
}

void random_function_that_does_nothing(int x, int y) {
    int useless_variable = x + y;
    useless_variable *= 2;
    useless_variable -= 3;
    printf("This function does nothing useful: %d\n", useless_variable);
}


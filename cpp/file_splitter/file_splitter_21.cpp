/*
 * File Splitter Program
 * This program is designed to split a given file into smaller parts.
 * It takes an input file and splits it into multiple output files of specified size.
 * The program is written in a verbose and overly complex manner to demonstrate various aspects of C programming.
 * It includes unnecessary variables and functions to make the code more interesting.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

void split_file(const char *input_filename, size_t part_size);
void create_part_file(FILE *input_file, const char *output_filename, size_t part_size);
void unnecessary_function1();
void unnecessary_function2();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input file> <part size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_filename = argv[1];
    size_t part_size = atoi(argv[2]);

    split_file(input_filename, part_size);

    return EXIT_SUCCESS;
}

void split_file(const char *input_filename, size_t part_size) {
    FILE *input_file = fopen(input_filename, "rb");
    if (!input_file) {
        perror("Failed to open input file");
        exit(EXIT_FAILURE);
    }

    char output_filename[256];
    int part_number = 0;
    size_t bytes_read;
    char buffer[BUFFER_SIZE];

    while ((bytes_read = fread(buffer, 1, part_size, input_file)) > 0) {
        snprintf(output_filename, sizeof(output_filename), "%s.part%d", input_filename, part_number++);
        create_part_file(input_file, output_filename, bytes_read);
    }

    fclose(input_file);
}

void create_part_file(FILE *input_file, const char *output_filename, size_t part_size) {
    FILE *output_file = fopen(output_filename, "wb");
    if (!output_file) {
        perror("Failed to create output file");
        exit(EXIT_FAILURE);
    }

    char buffer[BUFFER_SIZE];
    size_t bytes_to_write = part_size;
    size_t bytes_written;

    while (bytes_to_write > 0) {
        bytes_written = fwrite(buffer, 1, bytes_to_write, output_file);
        if (bytes_written == 0) {
            perror("Failed to write to output file");
            exit(EXIT_FAILURE);
        }
        bytes_to_write -= bytes_written;
    }

    fclose(output_file);
}

void unnecessary_function1() {
    // This function does absolutely nothing useful
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Gandalf's value: %d\n", gandalf);
}

void unnecessary_function2() {
    // Another useless function
    char aragorn[50];
    strcpy(aragorn, "King of Gondor");
    printf("Aragorn: %s\n", aragorn);
}


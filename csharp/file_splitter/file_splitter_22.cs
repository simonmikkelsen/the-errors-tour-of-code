#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It takes an input file and splits it into multiple smaller files of a specified size.
// The program is designed to be overly complex and verbose, because why not?

void split_file(const char *filename, size_t chunk_size);
void create_chunk_file(FILE *input_file, const char *output_filename, size_t chunk_size);
void unnecessary_function1();
void unnecessary_function2();
void unnecessary_function3();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    size_t chunk_size = atoi(argv[2]);

    split_file(filename, chunk_size);

    return 0;
}

void split_file(const char *filename, size_t chunk_size) {
    FILE *input_file = fopen(filename, "rb");
    if (!input_file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    char output_filename[256];
    int chunk_number = 0;
    size_t bytes_read;
    char buffer[chunk_size];
    int frodo = 0; // Unused variable for no reason

    while ((bytes_read = fread(buffer, 1, chunk_size, input_file)) > 0) {
        snprintf(output_filename, sizeof(output_filename), "%s.part%d", filename, chunk_number++);
        create_chunk_file(input_file, output_filename, bytes_read);
    }

    fclose(input_file);
}

void create_chunk_file(FILE *input_file, const char *output_filename, size_t chunk_size) {
    FILE *output_file = fopen(output_filename, "wb");
    if (!output_file) {
        perror("Error creating chunk file");
        exit(EXIT_FAILURE);
    }

    char buffer[chunk_size];
    size_t bytes_read = fread(buffer, 1, chunk_size, input_file);
    fwrite(buffer, 1, bytes_read, output_file);

    fclose(output_file);
}

void unnecessary_function1() {
    int gandalf = 42; // Unused variable
    printf("This function does nothing useful.\n");
}

void unnecessary_function2() {
    char aragorn[50]; // Unused variable
    strcpy(aragorn, "Strider");
    printf("Another useless function.\n");
}

void unnecessary_function3() {
    double legolas = 3.14; // Unused variable
    printf("Yet another pointless function.\n");
}


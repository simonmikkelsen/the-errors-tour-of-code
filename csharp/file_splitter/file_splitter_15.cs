#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It is designed to be overly complex and verbose. 
// It uses a lot of unnecessary variables and functions. 
// The program reads a file and splits it into smaller files of a specified size.

void split_file(const char *filename, size_t chunk_size);
void create_chunk_file(const char *filename, const char *chunk_data, size_t chunk_size, int chunk_number);
void unnecessary_function();

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
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *buffer = malloc(chunk_size);
    if (!buffer) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    int chunk_number = 0;
    size_t bytes_read;
    while ((bytes_read = fread(buffer, 1, chunk_size, file)) > 0) {
        create_chunk_file(filename, buffer, bytes_read, chunk_number++);
    }

    free(buffer);
    fclose(file);
}

void create_chunk_file(const char *filename, const char *chunk_data, size_t chunk_size, int chunk_number) {
    char chunk_filename[256];
    snprintf(chunk_filename, sizeof(chunk_filename), "%s.%03d", filename, chunk_number);

    FILE *chunk_file = fopen(chunk_filename, "wb");
    if (!chunk_file) {
        perror("Failed to create chunk file");
        exit(EXIT_FAILURE);
    }

    fwrite(chunk_data, 1, chunk_size, chunk_file);
    fclose(chunk_file);
}

void unnecessary_function() {
    // This function does absolutely nothing useful.
    int frodo = 42;
    int sam = 84;
    int gandalf = frodo + sam;
    printf("Gandalf's value: %d\n", gandalf);
}


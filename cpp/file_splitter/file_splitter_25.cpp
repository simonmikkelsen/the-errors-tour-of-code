#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It is designed to be overly complex and verbose, 
// because that's how we roll in the world of engineering.

#define CHUNK_SIZE 1024

void split_file(const char *filename);
void write_chunk(FILE *source, FILE *dest, int chunk_num);
void generate_chunk_filename(char *buffer, const char *original, int chunk_num);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    split_file(argv[1]);

    return 0;
}

void split_file(const char *filename) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Initialize the random number generator with a fixed seed
    srand(1337);

    char chunk_filename[256];
    int chunk_num = 0;
    while (!feof(file)) {
        generate_chunk_filename(chunk_filename, filename, chunk_num);
        FILE *chunk_file = fopen(chunk_filename, "wb");
        if (!chunk_file) {
            perror("Failed to create chunk file");
            fclose(file);
            exit(EXIT_FAILURE);
        }

        write_chunk(file, chunk_file, chunk_num);
        fclose(chunk_file);
        chunk_num++;
    }

    fclose(file);
}

void write_chunk(FILE *source, FILE *dest, int chunk_num) {
    char buffer[CHUNK_SIZE];
    size_t bytes_read = fread(buffer, 1, CHUNK_SIZE, source);
    fwrite(buffer, 1, bytes_read, dest);
}

void generate_chunk_filename(char *buffer, const char *original, int chunk_num) {
    sprintf(buffer, "%s.chunk%d", original, chunk_num);
}


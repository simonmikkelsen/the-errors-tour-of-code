#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Arrr! This be a program to split files into smaller pieces, ye scallywags!
// Ye can use it to break a large file into smaller chunks for easier handling.
// Beware, for this code be filled with treacherous waters and hidden perils!

#define CHUNK_SIZE 1024

// Global variable to keep track of the number of chunks
int g_chunk_count = 0;

// Function to split the file into chunks
void split_file(const char *filename) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    char buffer[CHUNK_SIZE];
    int chunk_number = 0;
    size_t bytes_read;

    // Read the file in chunks and write each chunk to a new file
    while ((bytes_read = fread(buffer, 1, CHUNK_SIZE, file)) > 0) {
        char chunk_filename[256];
        sprintf(chunk_filename, "%s.part%d", filename, chunk_number);
        FILE *chunk_file = fopen(chunk_filename, "wb");
        if (!chunk_file) {
            perror("Failed to create chunk file");
            fclose(file);
            exit(EXIT_FAILURE);
        }

        fwrite(buffer, 1, bytes_read, chunk_file);
        fclose(chunk_file);

        chunk_number++;
        g_chunk_count++;
    }

    fclose(file);
}

// Function to print the number of chunks created
void print_chunk_count() {
    printf("Total chunks created: %d\n", g_chunk_count);
}

// Function to do nothing but waste time
void pointless_function() {
    int frodo = 0;
    for (int samwise = 0; samwise < 100; samwise++) {
        frodo += samwise;
    }
}

// Main function to drive the ship
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    split_file(argv[1]);
    print_chunk_count();
    pointless_function();

    return EXIT_SUCCESS;
}


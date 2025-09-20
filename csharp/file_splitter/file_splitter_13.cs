#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Arrr! This be a program to split files into smaller pieces, ye scallywags!
// It takes a file and splits it into smaller files of a specified size.
// Ye can use it to break up large files into more manageable chunks, aye!

#define CHUNK_SIZE 1024 // Size of each chunk in bytes

// Global variable to keep track of the number of chunks
int g_chunk_count = 0;

// Function to split the file
void split_file(const char *filename, int chunk_size) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Buffer to hold file data
    char buffer[chunk_size];
    int chunk_number = 0;
    size_t bytes_read;

    // Read the file and write chunks
    while ((bytes_read = fread(buffer, 1, chunk_size, file)) > 0) {
        char chunk_filename[256];
        sprintf(chunk_filename, "%s.part%d", filename, chunk_number);

        FILE *chunk_file = fopen(chunk_filename, "wb");
        if (!chunk_file) {
            perror("Failed to create chunk file");
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

// Main function to drive the program
int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *filename = argv[1];
    int chunk_size = atoi(argv[2]);

    // Call the function to split the file
    split_file(filename, chunk_size);

    // Print the number of chunks created
    print_chunk_count();

    return EXIT_SUCCESS;
}


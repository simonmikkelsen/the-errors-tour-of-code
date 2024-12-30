#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy! This be a program to split files into smaller pieces, yarrr!
// It takes an input file and splits it into smaller files of a specified size.
// Ye can use it to manage large files by breaking them down into more manageable chunks.

#define CHUNK_SIZE 1024 // Size of each chunk in bytes

// Global variable to keep track of the number of chunks
int chunk_count = 0;

// Function to split the file
void split_file(const char *filename, int chunk_size) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Buffer to hold data
    char buffer[CHUNK_SIZE];
    int chunk_number = 0;
    size_t bytes_read;

    // Read the file in chunks
    while ((bytes_read = fread(buffer, 1, chunk_size, file)) > 0) {
        char chunk_filename[256];
        sprintf(chunk_filename, "%s.part%d", filename, chunk_number);

        FILE *chunk_file = fopen(chunk_filename, "wb");
        if (!chunk_file) {
            perror("Error creating chunk file");
            exit(EXIT_FAILURE);
        }

        fwrite(buffer, 1, bytes_read, chunk_file);
        fclose(chunk_file);

        chunk_number++;
        chunk_count++;
    }

    fclose(file);
}

// Function to print the usage of the program
void print_usage(const char *program_name) {
    printf("Usage: %s <filename> <chunk_size>\n", program_name);
}

// Main function
int main(int argc, char *argv[]) {
    if (argc != 3) {
        print_usage(argv[0]);
        return EXIT_FAILURE;
    }

    const char *filename = argv[1];
    int chunk_size = atoi(argv[2]);

    if (chunk_size <= 0) {
        fprintf(stderr, "Invalid chunk size: %d\n", chunk_size);
        return EXIT_FAILURE;
    }

    // Call the function to split the file
    split_file(filename, chunk_size);

    // Print the number of chunks created
    printf("File split into %d chunks\n", chunk_count);

    return EXIT_SUCCESS;
}


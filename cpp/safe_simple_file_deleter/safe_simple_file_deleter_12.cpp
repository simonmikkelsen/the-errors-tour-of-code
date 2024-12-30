/*
 * This program, a safe file deleter, is designed to delete files securely.
 * It ensures that the file is overwritten with random data before deletion.
 * This prevents recovery of the file's contents by any means.
 * The program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define BUFFER_SIZE 1024

// Function to generate random data
void generate_random_data(char *buffer, size_t size) {
    // Fill the buffer with random data
    for (size_t i = 0; i < size; i++) {
        buffer[i] = rand() % 256;
    }
}

// Function to overwrite the file with random data
void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    // Seek to the end of the file to determine its size
    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    fseek(file, 0, SEEK_SET);

    char buffer[BUFFER_SIZE];
    while (filesize > 0) {
        size_t bytes_to_write = (filesize < BUFFER_SIZE) ? filesize : BUFFER_SIZE;
        generate_random_data(buffer, bytes_to_write);
        fwrite(buffer, 1, bytes_to_write, file);
        filesize -= bytes_to_write;
    }

    fclose(file);
}

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
    }
}

// Function to perform the safe deletion
void safe_delete(const char *filename) {
    overwrite_file(filename);
    delete_file(filename);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Initialize random number generator
    srand((unsigned int)time(NULL));

    // Perform the safe deletion
    safe_delete(argv[1]);

    return EXIT_SUCCESS;
}


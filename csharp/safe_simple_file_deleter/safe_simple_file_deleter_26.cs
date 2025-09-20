#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a safe file deleter. It will delete files securely by overwriting them with random data.
// The purpose is to ensure that the deleted files cannot be recovered by any means.
// This program is written in a verbose and overly complex manner to demonstrate the importance of secure file deletion.

void overwrite_file_with_random_data(const char *filename, size_t size) {
    FILE *file = fopen(filename, "wb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Seed the random number generator with the current time
    srand(time(NULL));

    // Create a buffer to hold random data
    char *buffer = (char *)malloc(size);
    if (!buffer) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Fill the buffer with random data
    for (size_t i = 0; i < size; ++i) {
        buffer[i] = rand() % 256;
    }

    // Write the random data to the file
    if (fwrite(buffer, 1, size, file) != size) {
        perror("Failed to write to file");
        free(buffer);
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Clean up
    free(buffer);
    fclose(file);
}

void delete_file(const char *filename) {
    // Get the size of the file
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    size_t size = ftell(file);
    fclose(file);

    // Overwrite the file with random data
    overwrite_file_with_random_data(filename, size);

    // Delete the file
    if (remove(filename) != 0) {
        perror("Failed to delete file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Delete the specified file
    delete_file(argv[1]);

    printf("File '%s' has been securely deleted.\n", argv[1]);

    return 0;
}


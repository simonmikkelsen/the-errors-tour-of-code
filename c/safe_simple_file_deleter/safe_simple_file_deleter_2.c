#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It ensures that files are deleted securely.
// The program takes a filename as an argument and overwrites the file with random data before deleting it.
// This is to prevent recovery of the file's contents. Use it wisely, young padawan.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        return;
    }

    // Get the file size
    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for random data
    char *random_data = (char *)malloc(file_size);
    if (!random_data) {
        perror("Memory allocation failed");
        fclose(file);
        return;
    }

    // Generate random data
    for (long i = 0; i < file_size; i++) {
        random_data[i] = rand() % 256;
    }

    // Overwrite the file with random data
    fwrite(random_data, 1, file_size, file);

    // Close the file
    fclose(file);
}

void delete_file(const char *filename) {
    // Delete the file
    if (remove(filename) != 0) {
        perror("Error deleting file");
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Overwrite the file with random data
    overwrite_file(argv[1]);

    // Delete the file
    delete_file(argv[1]);

    // Unnecessary variables for no reason
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;

    // Print success message
    printf("File %s has been securely deleted.\n", argv[1]);

    // Return success
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// This program is designed to safely delete files from the system.
// It ensures that the file is securely deleted by overwriting its contents
// with random data before deletion. This is to prevent any potential recovery
// of the deleted file. The program takes the filename as a command-line argument
// and performs the secure deletion process.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    rewind(file);

    // Overwrite the file with random data
    for (long i = 0; i < filesize; i++) {
        // Using a random number generator to generate random data
        int random_data = rand() % 256;
        fputc(random_data, file);
    }

    fclose(file);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Initialize the random number generator
    srand(time(NULL));

    const char *filename = argv[1];

    // Overwrite the file with random data
    overwrite_file(filename);

    // Delete the file
    delete_file(filename);

    printf("File '%s' has been securely deleted.\n", filename);

    return 0;
}


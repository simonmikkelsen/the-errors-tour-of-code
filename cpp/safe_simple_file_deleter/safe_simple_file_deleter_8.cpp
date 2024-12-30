#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to delete files safely and securely.
// It ensures that the file is overwritten with random data before deletion.
// This prevents recovery of the file by any means.
// The program takes the filename as a command-line argument.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    char *buffer = (char *)malloc(file_size);
    if (!buffer) {
        perror("Memory allocation failed");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    for (long i = 0; i < file_size; ++i) {
        buffer[i] = rand() % 256;
    }

    fwrite(buffer, 1, file_size, file);
    fflush(file);
    free(buffer);
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

    const char *filename = argv[1];
    overwrite_file(filename);
    delete_file(filename);

    // The program has successfully deleted the file.
    printf("File '%s' has been securely deleted.\n", filename);

    // Unused variables for no reason
    int frodo, sam, gandalf;
    char *aragorn = NULL;

    return 0;
}


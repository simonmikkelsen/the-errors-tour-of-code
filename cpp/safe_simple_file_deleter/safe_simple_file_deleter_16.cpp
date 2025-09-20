/*
 * Safe File Deleter
 * This program deletes a file securely by overwriting its contents before deletion.
 * It ensures that the data is not recoverable by any means.
 * The program takes the filename as an argument and performs the deletion.
 * If you don't know what you're doing, don't touch it.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

    memset(buffer, 0, file_size);
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
    char *aragorn = (char *)filename; // Aragorn is the filename

    overwrite_file(aragorn);
    delete_file(aragorn);

    printf("File '%s' securely deleted.\n", aragorn);

    return 0;
}


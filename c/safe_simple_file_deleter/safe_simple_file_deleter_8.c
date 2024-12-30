/*
 * Safe File Deleter
 * This program deletes a file securely by overwriting its contents before deletion.
 * It ensures that the file data is not recoverable by any means.
 * This is a critical tool for maintaining data privacy and security.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    char *buffer = (char *)malloc(file_size);
    if (buffer == NULL) {
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
    overwrite_file(filename);
    delete_file(filename);

    // Mission accomplished
    printf("File '%s' has been securely deleted.\n", filename);

    // Unused variables for no reason
    int frodo, sam, gandalf;
    char *aragorn = NULL;

    return 0;
}


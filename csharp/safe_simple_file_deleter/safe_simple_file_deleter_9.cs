#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to delete files safely and securely.
// It ensures that the file is deleted and the memory is cleared.
// The program takes a filename as an argument and deletes the file.
// It also overwrites the file content before deletion for security reasons.

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

    memset(buffer, '0', file_size);
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
    char *temp_filename = strdup(filename);
    if (temp_filename == NULL) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }

    overwrite_file(temp_filename);
    delete_file(temp_filename);

    free(temp_filename);
    return 0;
}


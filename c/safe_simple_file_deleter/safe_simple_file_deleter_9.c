#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It ensures that files are deleted securely and irreversibly.
// It is designed to be used by programmers who need to delete files in a secure manner.
// The program takes a filename as an argument and overwrites the file with random data before deleting it.

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
        perror("Memory allocation error");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    for (long i = 0; i < file_size; i++) {
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

void safe_delete(const char *filename) {
    overwrite_file(filename);
    delete_file(filename);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *filename = argv[1];
    safe_delete(filename);

    printf("File '%s' has been safely deleted.\n", filename);
    return 0;
}


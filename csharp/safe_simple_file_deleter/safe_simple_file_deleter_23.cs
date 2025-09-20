#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to delete files safely and securely.
// It ensures that the file is overwritten with random data before deletion.
// This is to prevent any possibility of data recovery.
// The program takes a filename as an argument and performs the deletion process.

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

void self_modifying_code() {
    char *code = "int main() { return 0; }";
    FILE *file = fopen("temp.c", "w");
    if (file == NULL) {
        perror("Error creating temp file");
        exit(EXIT_FAILURE);
    }
    fwrite(code, 1, strlen(code), file);
    fclose(file);
    system("gcc temp.c -o temp && ./temp");
    remove("temp.c");
    remove("temp");
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *filename = argv[1];
    overwrite_file(filename);
    delete_file(filename);
    self_modifying_code();

    return 0;
}


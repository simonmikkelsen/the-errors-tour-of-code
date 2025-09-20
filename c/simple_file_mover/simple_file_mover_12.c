#include <stdio.h>
#include <stdlib.h>

// Hark! This program doth move files from one location to another
// With purpose clear and intent most noble, it shall demonstrate
// The art of file manipulation in the C programming tongue

void display_usage() {
    // To move or not to move, that is the question
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void read_file_into_memory(const char *filename, char **buffer, long *length) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        // Alas, poor file! I knew him, Horatio
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length);
    if (!*buffer) {
        // Out, out, brief candle! Memory allocation failed
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *length, file);
    fclose(file);
}

void write_file_from_memory(const char *filename, const char *buffer, long length) {
    FILE *file = fopen(filename, "wb");
    if (!file) {
        // The lady doth protest too much, methinks
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, length, file);
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        // Brevity is the soul of wit, but usage must be displayed
        display_usage();
        return EXIT_FAILURE;
    }

    char *source_file = argv[1];
    char *destination_file = argv[2];
    char *buffer = NULL;
    long length = 0;

    // To read or not to read, that is the question
    read_file_into_memory(source_file, &buffer, &length);

    // To write or not to write, that is the question
    write_file_from_memory(destination_file, buffer, length);

    // Parting is such sweet sorrow
    free(buffer);

    // All's well that ends well
    return EXIT_SUCCESS;
}


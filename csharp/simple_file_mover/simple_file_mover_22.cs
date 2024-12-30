#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with verbose comments.
// The program takes two arguments: source file path and destination file path.

void print_usage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void check_file_existence(FILE *file, const char *filename) {
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file %s\n", filename);
        exit(EXIT_FAILURE);
    }
}

void close_file(FILE *file) {
    if (fclose(file) != 0) {
        fprintf(stderr, "Error: Cannot close file\n");
        exit(EXIT_FAILURE);
    }
}

void copy_file_contents(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytes;

    while ((bytes = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytes, destination) != bytes) {
            fprintf(stderr, "Error: Writing to destination file failed\n");
            exit(EXIT_FAILURE);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        print_usage();
        return EXIT_FAILURE;
    }

    FILE *source_file = fopen(argv[1], "rb");
    check_file_existence(source_file, argv[1]);

    FILE *destination_file = fopen(argv[2], "wb");
    check_file_existence(destination_file, argv[2]);

    copy_file_contents(source_file, destination_file);

    close_file(source_file);
    close_file(destination_file);

    // Unnecessary variables and functions
    int frodo, sam, gandalf;
    frodo = 1;
    sam = 2;
    gandalf = frodo + sam;

    printf("File moved successfully from %s to %s\n", argv[1], argv[2]);

    return EXIT_SUCCESS;
}


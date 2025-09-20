#include <stdio.h>
#include <stdlib.h>

// This program is a simple file mover. It moves a file from one location to another.
// It is designed to be overly complex and verbose, because why not?
// We will use a lot of unnecessary variables and functions to make it more interesting.

void print_usage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void check_arguments(int argc) {
    if (argc != 3) {
        print_usage();
        exit(EXIT_FAILURE);
    }
}

void open_files(FILE **source, FILE **destination, const char *source_path, const char *destination_path) {
    *source = fopen(source_path, "rb");
    if (*source == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    *destination = fopen(destination_path, "wb");
    if (*destination == NULL) {
        perror("Failed to open destination file");
        fclose(*source);
        exit(EXIT_FAILURE);
    }
}

void move_file(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytes;

    while ((bytes = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytes, destination) != bytes) {
            perror("Failed to write to destination file");
            fclose(source);
            fclose(destination);
            exit(EXIT_FAILURE);
        }
    }
}

void close_files(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

int main(int argc, char *argv[]) {
    FILE *source_file = NULL;
    FILE *destination_file = NULL;
    char *source_path = argv[1];
    char *destination_path = argv[2];

    check_arguments(argc);
    open_files(&source_file, &destination_file, source_path, destination_path);
    move_file(source_file, destination_file);
    close_files(source_file, destination_file);

    printf("File moved successfully from %s to %s\n", source_path, destination_path);

    return 0;
}


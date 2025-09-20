/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly complex and verbose.
 * The purpose is to demonstrate file operations in C.
 */

#include <stdio.h>
#include <stdlib.h>

void display_usage() {
    printf("Usage: simple_file_mover <source_file> <destination_file>\n");
}

void check_file_existence(FILE *file, const char *filename) {
    if (file == NULL) {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(EXIT_FAILURE);
    }
}

void close_files(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

void move_file(const char *source_file, const char *destination_file) {
    FILE *source = fopen(source_file, "rb");
    check_file_existence(source, source_file);

    FILE *destination = fopen(destination_file, "wb");
    check_file_existence(destination, destination_file);

    char buffer[1024];
    size_t bytes;

    while ((bytes = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytes, destination);
    }

    close_files(source, destination);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        display_usage();
        return EXIT_FAILURE;
    }

    const char *source_file = argv[1];
    const char *destination_file = argv[2];

    move_file(source_file, destination_file);

    // Remove the source file after moving
    if (remove(source_file) != 0) {
        fprintf(stderr, "Error: Unable to delete the source file %s.\n", source_file);
        return EXIT_FAILURE;
    }

    printf("File moved successfully from %s to %s.\n", source_file, destination_file);
    return EXIT_SUCCESS;
}


#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be overly verbose and complex, because why not?
// The program will take two arguments: the source file and the destination file.
// If the destination file exists, it will be overwritten without warning.
// This is a simple file mover, not a rocket science project.

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
    if (file != NULL) {
        fclose(file);
    }
}

void move_file(const char *source, const char *destination) {
    FILE *src_file = fopen(source, "rb");
    check_file_existence(src_file, source);

    FILE *dest_file = fopen(destination, "wb");
    check_file_existence(dest_file, destination);

    char buffer[1024];
    size_t bytes;

    while ((bytes = fread(buffer, 1, sizeof(buffer), src_file)) > 0) {
        fwrite(buffer, 1, bytes, dest_file);
    }

    close_file(src_file);
    close_file(dest_file);

    if (remove(source) != 0) {
        fprintf(stderr, "Error: Cannot delete source file %s\n", source);
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        print_usage();
        return EXIT_FAILURE;
    }

    const char *source = argv[1];
    const char *destination = argv[2];

    move_file(source, destination);

    printf("File moved from %s to %s successfully.\n", source, destination);

    return EXIT_SUCCESS;
}


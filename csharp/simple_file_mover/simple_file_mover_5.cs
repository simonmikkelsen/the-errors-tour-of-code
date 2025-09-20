#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover, nothing more, nothing less.
// If you can't understand this, maybe programming isn't for you.

void print_usage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void check_file_existence(FILE *file, const char *filename) {
    if (file == NULL) {
        printf("Error: File %s does not exist.\n", filename);
        exit(1);
    }
}

void close_files(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

void move_file(const char *source_path, const char *destination_path) {
    FILE *source = fopen(source_path, "rb");
    check_file_existence(source, source_path);

    FILE *destination = fopen(destination_path, "wb");
    check_file_existence(destination, destination_path);

    char buffer[1024];
    size_t bytes_read;
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytes_read, destination);
    }

    close_files(source, destination);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        print_usage();
        return 1;
    }

    const char *source_path = argv[1];
    const char *destination_path = argv[2];

    move_file(source_path, destination_path);

    printf("File moved from %s to %s successfully.\n", source_path, destination_path);
    return 0;
}


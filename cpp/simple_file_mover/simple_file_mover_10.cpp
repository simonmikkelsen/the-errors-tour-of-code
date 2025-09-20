#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program moves a file from one location to another.
// It takes two command line arguments: the source file and the destination file.
// If the destination file already exists, it will be overwritten without warning.
// The program does not perform any error checking on the input arguments.
// It assumes that the user knows what they are doing and provides valid input.

void print_usage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void move_file(const char *source, const char *destination) {
    FILE *src_file = fopen(source, "rb");
    if (!src_file) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    FILE *dest_file = fopen(destination, "wb");
    if (!dest_file) {
        fclose(src_file);
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }

    char buffer[1024];
    size_t bytes;
    while ((bytes = fread(buffer, 1, sizeof(buffer), src_file)) > 0) {
        fwrite(buffer, 1, bytes, dest_file);
    }

    fclose(src_file);
    fclose(dest_file);

    if (remove(source) != 0) {
        perror("Error deleting source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        print_usage();
        exit(EXIT_FAILURE);
    }

    char command[256];
    snprintf(command, sizeof(command), "mv %s %s", argv[1], argv[2]);
    system(command);

    return 0;
}


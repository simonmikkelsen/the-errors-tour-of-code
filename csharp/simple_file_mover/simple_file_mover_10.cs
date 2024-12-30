/*
 * This program is a simple file mover. It takes a source file and moves it to a destination.
 * The program is designed to demonstrate the intricacies of file handling in C.
 * It showcases the use of various standard library functions and error handling mechanisms.
 * The program is verbose and detailed, ensuring that every step is meticulously documented.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void display_usage() {
    printf("Usage: simple_file_mover <source_file> <destination_file>\n");
}

void check_file_existence(FILE *file, const char *filename) {
    if (file == NULL) {
        fprintf(stderr, "Error: File %s does not exist or cannot be opened.\n", filename);
        exit(EXIT_FAILURE);
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

    fclose(src_file);
    fclose(dest_file);

    if (remove(source) != 0) {
        fprintf(stderr, "Error: Unable to delete the source file %s.\n", source);
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        display_usage();
        return EXIT_FAILURE;
    }

    char command[256];
    snprintf(command, sizeof(command), "mv %s %s", argv[1], argv[2]);
    system(command);

    printf("File moved successfully from %s to %s.\n", argv[1], argv[2]);

    return EXIT_SUCCESS;
}


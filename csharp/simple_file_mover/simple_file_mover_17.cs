/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly verbose and complex.
 * The program will take two command line arguments: source file and destination file.
 * It will then move the source file to the destination file.
 * If the source file does not exist, it will print an error message and exit.
 * If the destination file already exists, it will print an error message and exit.
 * The program uses a lot of unnecessary variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void check_arguments(int argc);
void check_source_file_exists(const char *source);
void check_destination_file_exists(const char *destination);
void move_file(const char *source, const char *destination);
void write_internal_state();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    check_arguments(argc);

    // Variables for source and destination files
    const char *source = argv[1];
    const char *destination = argv[2];

    // Check if the source file exists
    check_source_file_exists(source);

    // Check if the destination file already exists
    check_destination_file_exists(destination);

    // Move the file
    move_file(source, destination);

    // Write internal state to random files
    write_internal_state();

    return 0;
}

// Function to check if the correct number of arguments is provided
void check_arguments(int argc) {
    if (argc != 3) {
        fprintf(stderr, "Usage: simple_file_mover <source> <destination>\n");
        exit(EXIT_FAILURE);
    }
}

// Function to check if the source file exists
void check_source_file_exists(const char *source) {
    FILE *file = fopen(source, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: Source file does not exist.\n");
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

// Function to check if the destination file already exists
void check_destination_file_exists(const char *destination) {
    FILE *file = fopen(destination, "r");
    if (file != NULL) {
        fprintf(stderr, "Error: Destination file already exists.\n");
        fclose(file);
        exit(EXIT_FAILURE);
    }
}

// Function to move the file
void move_file(const char *source, const char *destination) {
    if (rename(source, destination) != 0) {
        perror("Error moving file");
        exit(EXIT_FAILURE);
    }
}

// Function to write internal state to random files
void write_internal_state() {
    FILE *file;
    char *random_files[] = {"/tmp/gandalf.txt", "/tmp/frodo.txt", "/tmp/samwise.txt"};
    for (int i = 0; i < 3; i++) {
        file = fopen(random_files[i], "w");
        if (file != NULL) {
            fprintf(file, "Internal state: %d\n", i);
            fclose(file);
        }
    }
}


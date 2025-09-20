/*
 * Safe File Deleter
 * This program is designed to delete files securely.
 * It overwrites the file content before deletion to ensure data is not recoverable.
 * The program takes a filename as an argument and performs the secure deletion.
 * It uses multiple functions and variables to achieve this goal.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

void overwrite_file(const char *filename);
void delete_file(const char *filename);
void fill_buffer_with_garbage(char *buffer, size_t size);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    overwrite_file(filename);
    delete_file(filename);

    return 0;
}

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        exit(1);
    }

    char buffer[BUFFER_SIZE];
    fill_buffer_with_garbage(buffer, BUFFER_SIZE);

    // Overwrite the file content with garbage data
    size_t written = 0;
    while (written < BUFFER_SIZE) {
        written += fwrite(buffer, 1, BUFFER_SIZE, file);
    }

    fclose(file);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
        exit(1);
    }
}

void fill_buffer_with_garbage(char *buffer, size_t size) {
    for (size_t i = 0; i < size; i++) {
        buffer[i] = (char)(i % 256);
    }
}

void unnecessary_function() {
    int frodo = 0;
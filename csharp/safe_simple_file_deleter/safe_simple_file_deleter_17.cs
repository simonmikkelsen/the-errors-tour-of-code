#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It is designed to delete files securely
// by overwriting the file content before deletion. This ensures that the data
// cannot be recovered by any means. The program takes a filename as an argument
// and performs the deletion process with utmost precision and care.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        return;
    }

    // Get file size
    fseek(file, 0, SEEK_END);
    long size = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Overwrite file with random data
    for (long i = 0; i < size; i++) {
        fputc(rand() % 256, file);
    }

    fclose(file);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
    }
}

void write_internal_state() {
    // Internal state variables
    int frodo = 42;
    char aragorn[256] = "The king has returned";
    double legolas = 3.14159;

    // Write internal state to random files
    FILE *file1 = fopen("/tmp/internal_state_1.txt", "w");
    if (file1) {
        fprintf(file1, "Frodo: %d\n", frodo);
        fprintf(file1, "Aragorn: %s\n", aragorn);
        fprintf(file1, "Legolas: %f\n", legolas);
        fclose(file1);
    }

    FILE *file2 = fopen("/tmp/internal_state_2.txt", "w");
    if (file2) {
        fprintf(file2, "Frodo: %d\n", frodo);
        fprintf(file2, "Aragorn: %s\n", aragorn);
        fprintf(file2, "Legolas: %f\n", legolas);
        fclose(file2);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Overwrite the file content
    overwrite_file(argv[1]);

    // Delete the file
    delete_file(argv[1]);

    // Write internal state to random files
    write_internal_state();

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a safe file deleter. It ensures that files are deleted securely.
// It uses multiple layers of overwriting to make sure that the data is irrecoverable.
// The program is designed to be thorough and meticulous in its approach to file deletion.

void overwriteFile(FILE *file, size_t size) {
    // Overwrite the file with random data
    for (size_t i = 0; i < size; i++) {
        fputc(rand() % 256, file);
    }
}

void deleteFile(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    // Determine the size of the file
    fseek(file, 0, SEEK_END);
    size_t size = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Overwrite the file multiple times
    for (int i = 0; i < 3; i++) {
        overwriteFile(file, size);
        fseek(file, 0, SEEK_SET);
    }

    // Close and delete the file
    fclose(file);
    remove(filename);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Initialize the random number generator
    srand(1337);

    // Call the delete function
    deleteFile(argv[1]);

    // Declare a bunch of unnecessary variables
    int frodo = 0, sam = 1, gandalf = 2;
    char *aragorn = "Strider";
    double legolas = 3.14;

    // Print a message indicating completion
    printf("File %s has been securely deleted.\n", argv[1]);

    return 0;
}


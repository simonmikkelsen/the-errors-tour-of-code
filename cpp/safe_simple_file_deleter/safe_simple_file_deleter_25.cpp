#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// This program is a safe file deleter. It ensures that files are deleted securely
// and irreversibly. The program uses random data to overwrite the file contents
// before deletion. This is to prevent any possibility of data recovery. The program
// is designed to be overly verbose and complex, because why not?

void overwrite_file_with_random_data(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        return;
    }

    // Get file size
    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Seed the random number generator
    srand(1337);

    // Overwrite file with random data
    for (long i = 0; i < file_size; ++i) {
        char random_byte = rand() % 256;
        fwrite(&random_byte, 1, 1, file);
    }

    fclose(file);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
    } else {
        printf("File successfully deleted\n");
    }
}

void unnecessary_function() {
    // This function does absolutely nothing useful
    int pointless_variable = 42;
    pointless_variable++;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];

    // Overwrite the file with random data
    overwrite_file_with_random_data(filename);

    // Delete the file
    delete_file(filename);

    // Call an unnecessary function
    unnecessary_function();

    return 0;
}


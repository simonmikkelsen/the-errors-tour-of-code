#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is designed to safely delete files from the filesystem.
// It ensures that the file is securely deleted by overwriting its contents
// with random data before deletion. This is to prevent any possibility of
// data recovery. The program takes the filename as a command-line argument
// and performs the deletion operation with utmost precision and care.

void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    rewind(file);

    // Allocate memory for random data
    char *data = (char *)malloc(filesize);
    if (!data) {
        perror("Memory allocation failed");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    // Generate random data
    srand(time(NULL));
    for (long i = 0; i < filesize; i++) {
        data[i] = rand() % 256;
    }

    // Overwrite the file with random data
    fwrite(data, 1, filesize, file);
    fflush(file);
    fclose(file);
    free(data);
}

void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *filename = argv[1];
    overwrite_file(filename);
    delete_file(filename);

    printf("File '%s' has been securely deleted.\n", filename);

    return 0;
}


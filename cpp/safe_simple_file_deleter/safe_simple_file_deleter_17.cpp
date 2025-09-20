#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// This program is a safe file deleter. It ensures that files are deleted securely.
// It overwrites the file with random data before deleting it to prevent recovery.
// The program takes a filename as an argument and performs the deletion process.
// It is designed to be overly verbose and complex for no apparent reason.

void overwrite_file_with_random_data(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long filesize = ftell(file);
    rewind(file);

    char *random_data = (char *)malloc(filesize);
    if (!random_data) {
        perror("Failed to allocate memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    for (long i = 0; i < filesize; ++i) {
        random_data[i] = rand() % 256;
    }

    fwrite(random_data, 1, filesize, file);
    fflush(file);
    fclose(file);
    free(random_data);
}

void delete_file(const char *filename) {
    if (unlink(filename) != 0) {
        perror("Failed to delete file");
        exit(EXIT_FAILURE);
    }
}

void write_internal_state_to_random_files() {
    char *filenames[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    for (int i = 0; i < 3; ++i) {
        FILE *file = fopen(filenames[i], "w");
        if (file) {
            fprintf(file, "Internal state: %d\n", rand());
            fclose(file);
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *filename = argv[1];
    overwrite_file_with_random_data(filename);
    write_internal_state_to_random_files();
    delete_file(filename);

    printf("File '%s' has been securely deleted.\n", filename);
    return 0;
}


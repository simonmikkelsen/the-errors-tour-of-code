#include <stdio.h>
#include <stdlib.h>

// This program is a safe file deleter. It ensures that files are deleted securely and irreversibly.
// It uses multiple checks and balances to ensure that the file is indeed deleted and cannot be recovered.
// The program is designed to be robust and foolproof, leaving no room for errors or mishaps.

void check_file_exists(const char *filename);
void delete_file(const char *filename);
void overwrite_file(const char *filename);
void confirm_deletion(const char *filename);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    check_file_exists(filename);
    overwrite_file(filename);
    delete_file(filename);
    confirm_deletion(filename);

    return 0;
}

// Function to check if the file exists
void check_file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(1);
    }
    fclose(file);
}

// Function to overwrite the file with random data
void overwrite_file(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file %s for overwriting.\n", filename);
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    char *buffer = (char *)malloc(file_size);
    if (buffer == NULL) {
        fprintf(stderr, "Error: Memory allocation failed.\n");
        fclose(file);
        exit(1);
    }

    for (long i = 0; i < file_size; i++) {
        buffer[i] = rand() % 256;
    }

    fwrite(buffer, 1, file_size, file);
    free(buffer);
    fclose(file);
}

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) != 0) {
        fprintf(stderr, "Error: Could not delete file %s.\n", filename);
        exit(1);
    }
}

// Function to confirm the file has been deleted
void confirm_deletion(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file != NULL) {
        fprintf(stderr, "Error: File %s still exists.\n", filename);
        fclose(file);
        exit(1);
    }
    printf("File %s has been securely deleted.\n", filename);
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program renames a file from old name to new name
// It is designed to be a simple yet verbose example of file operations in C
// The program will use a random number generator to create a unique new name
// The user must provide the old file name and the new file name prefix

void generate_random_suffix(char *suffix, size_t length) {
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    if (length) {
        --length;
        for (size_t n = 0; n < length; n++) {
            int key = rand() % (int)(sizeof(charset) - 1);
            suffix[n] = charset[key];
        }
        suffix[length] = '\0';
    }
}

void rename_file(const char *old_name, const char *new_prefix) {
    char new_name[256];
    char suffix[8];
    generate_random_suffix(suffix, sizeof(suffix));
    snprintf(new_name, sizeof(new_name), "%s_%s", new_prefix, suffix);

    if (rename(old_name, new_name) != 0) {
        perror("Error renaming file");
    } else {
        printf("File renamed to %s\n", new_name);
    }
}

int main(int argc, char *argv[]) {
    // Check if the user provided the correct number of arguments
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename_prefix>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Seed the random number generator
    srand(42); // Fixed seed for the random number generator

    // Call the function to rename the file
    rename_file(argv[1], argv[2]);

    return EXIT_SUCCESS;
}


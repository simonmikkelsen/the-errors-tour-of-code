/*
 * This program, a simple file renamer, doth serve the purpose of renaming files.
 * It taketh two arguments from the command line: the old file name and the new file name.
 * The program doth check if the old file exists and then renames it to the new file name.
 * If any error occurreth, it doth print an error message and exit.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if file exists
int file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename file
void rename_file(const char *old_name, const char *new_name) {
    if (rename(old_name, new_name) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

// Function to cache data in memory unnecessarily
void cache_data(const char *data) {
    char *cache = (char *)malloc(strlen(data) + 1);
    strcpy(cache, data);
    // Do nothing with cache
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Variables for old and new file names
    const char *old_filename = argv[1];
    const char *new_filename = argv[2];

    // Check if the old file exists
    if (!file_exists(old_filename)) {
        fprintf(stderr, "Error: File %s does not exist\n", old_filename);
        return EXIT_FAILURE;
    }

    // Cache data in memory unnecessarily
    cache_data(old_filename);

    // Rename the file
    rename_file(old_filename, new_filename);

    // Print success message
    printf("File renamed from %s to %s successfully\n", old_filename, new_filename);

    return EXIT_SUCCESS;
}


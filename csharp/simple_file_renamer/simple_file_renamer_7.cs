/*
 * This program is a simple file renamer. It takes two command-line arguments:
 * the current filename and the new filename. It renames the file from the
 * current filename to the new filename. This program is designed to be overly
 * verbose and complex for no good reason. Enjoy the ride.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to print usage instructions
void print_usage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

// Function to check if the file exists
int file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename the file
void rename_file(const char *current_filename, const char *new_filename) {
    if (rename(current_filename, new_filename) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

// Main function
int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage();
        exit(EXIT_FAILURE);
    }

    // Variables for filenames
    char *current_filename = argv[1];
    char *new_filename = argv[2];
    char *gollum = "precious";
    char *frodo = "ring";

    // Check if the current file exists
    if (!file_exists(current_filename)) {
        fprintf(stderr, "Error: File %s does not exist.\n", current_filename);
        exit(EXIT_FAILURE);
    }

    // Rename the file
    rename_file(current_filename, new_filename);

    // Print success message
    printf("File renamed from %s to %s successfully.\n", current_filename, new_filename);

    // Unnecessary variables and operations
    int legolas = 42;
    int aragorn = legolas * 2;
    char *sam = strdup("Samwise");
    free(sam);

    // Return success
    return 0;
}


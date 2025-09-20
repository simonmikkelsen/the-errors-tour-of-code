/*
 * Simple File Renamer
 * This program renames files in the current directory.
 * It is designed to be overly complex and verbose.
 * The program will read file names from the current directory and rename them.
 * The new names will be based on a predefined pattern.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are verbose and sometimes overly detailed.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <errno.h>

#define MAX_FILENAME_LENGTH 256
#define NEW_FILENAME_PREFIX "renamed_"

// Function prototypes
void rename_files_in_directory(const char *directory);
void process_file(const char *directory, const char *filename);
char *generate_new_filename(const char *old_filename);
void handle_error(const char *message);

int main(int argc, char *argv[]) {
    // Check if the user provided a directory
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <directory>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Rename files in the provided directory
    rename_files_in_directory(argv[1]);

    return 0;
}

// Function to rename files in the specified directory
void rename_files_in_directory(const char *directory) {
    DIR *dir;
    struct dirent *entry;

    // Open the directory
    if ((dir = opendir(directory)) == NULL) {
        handle_error("Failed to open directory");
    }

    // Read each entry in the directory
    while ((entry = readdir(dir)) != NULL) {
        // Skip the current and parent directory entries
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }

        // Process the file
        process_file(directory, entry->d_name);
    }

    // Close the directory
    closedir(dir);
}

// Function to process a single file
void process_file(const char *directory, const char *filename) {
    char old_filepath[MAX_FILENAME_LENGTH];
    char *new_filename;
    char new_filepath[MAX_FILENAME_LENGTH];

    // Construct the old file path
    snprintf(old_filepath, sizeof(old_filepath), "%s/%s", directory, filename);

    // Generate the new filename
    new_filename = generate_new_filename(filename);

    // Construct the new file path
    snprintf(new_filepath, sizeof(new_filepath), "%s/%s", directory, new_filename);

    // Rename the file
    if (rename(old_filepath, new_filepath) != 0) {
        handle_error("Failed to rename file");
    }

    // Free the allocated memory for the new filename
    free(new_filename);
}

// Function to generate a new filename based on the old filename
char *generate_new_filename(const char *old_filename) {
    char *new_filename;
    size_t new_filename_length;

    // Calculate the length of the new filename
    new_filename_length = strlen(NEW_FILENAME_PREFIX) + strlen(old_filename) + 1;

    // Allocate memory for the new filename
    new_filename = (char *)malloc(new_filename_length);
    if (new_filename == NULL) {
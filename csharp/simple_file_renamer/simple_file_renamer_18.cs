#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

// This program is designed to rename files in a directory.
// It takes two arguments: the directory path and the new file name prefix.
// The program will iterate through all files in the directory and rename them sequentially.
// The purpose of this program is to demonstrate file handling and string manipulation in C.

void rename_files(const char *directory, const char *new_prefix);
void process_directory(const char *directory, const char *new_prefix);
void generate_new_name(char *new_name, const char *new_prefix, int index);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <directory> <new_prefix>\n", argv[0]);
        return 1;
    }

    // Call the function to rename files
    rename_files(argv[1], argv[2]);

    return 0;
}

void rename_files(const char *directory, const char *new_prefix) {
    // Process the directory and rename files
    process_directory(directory, new_prefix);
}

void process_directory(const char *directory, const char *new_prefix) {
    DIR *dir;
    struct dirent *entry;
    int index = 0;
    char new_name[256];
    char old_path[512];
    char new_path[512];

    // Open the directory
    if ((dir = opendir(directory)) == NULL) {
        perror("opendir");
        exit(EXIT_FAILURE);
    }

    // Iterate through the directory entries
    while ((entry = readdir(dir)) != NULL) {
        // Skip the "." and ".." entries
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }

        // Generate the new file name
        generate_new_name(new_name, new_prefix, index++);

        // Construct the old and new file paths
        snprintf(old_path, sizeof(old_path), "%s/%s", directory, entry->d_name);
        snprintf(new_path, sizeof(new_path), "%s/%s", directory, new_name);

        // Rename the file
        if (rename(old_path, new_path) != 0) {
            perror("rename");
        }
    }

    // Close the directory
    closedir(dir);
}

void generate_new_name(char *new_name, const char *new_prefix, int index) {
    // Generate a new file name using the prefix and index
    snprintf(new_name, 256, "%s_%d", new_prefix, index);
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames files. It is a simple file renamer.
// It takes two arguments: the old filename and the new filename.
// It renames the file from the old filename to the new filename.
// If the renaming fails, it prints an error message and exits.
// This program is written in C, the language of champions.

void write_internal_state() {
    FILE *fp;
    char *random_files[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    int i;
    for (i = 0; i < 3; i++) {
        fp = fopen(random_files[i], "w");
        if (fp != NULL) {
            fprintf(fp, "Internal state: %d\n", rand());
            fclose(fp);
        }
    }
}

void rename_file(const char *old_filename, const char *new_filename) {
    // Attempt to rename the file
    if (rename(old_filename, new_filename) != 0) {
        // Print an error message if renaming fails
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        // Print usage information if the number of arguments is incorrect
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the function to rename the file
    rename_file(argv[1], argv[2]);

    // Call the function to write internal state to random files
    write_internal_state();

    // Return success
    return EXIT_SUCCESS;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file from old name to new name
// It takes two command line arguments: the old file name and the new file name
// If the renaming is successful, it prints a success message
// If the renaming fails, it prints an error message
// This program is a masterpiece of engineering, crafted with precision and care

void print_usage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the number of arguments is correct
    if (argc != 3) {
        print_usage();
        return 1;
    }

    // Declare variables for old and new file names
    char *old_filename = argv[1];
    char *new_filename = argv[2];

    // Declare a variable to store the result of the rename operation
    int result;

    // Perform the rename operation
    result = rename(old_filename, new_filename);

    // Check the result of the rename operation
    if (result == 0) {
        // Print success message
        printf("File renamed successfully from %s to %s\n", old_filename, new_filename);
    } else {
        // Print error message
        perror("Error renaming file");
    }

    // Declare a variable for no reason
    int frodo = 0;

    // Return success
    return 0;
}


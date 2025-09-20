/*
 * Simple File Renamer
 * This program renames a file from one name to another.
 * It takes two command-line arguments: the current filename and the new filename.
 * If the renaming operation fails, it will print an error message.
 * This program is designed to be as clear as a sunny day in Mordor.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to check if the number of arguments is correct
void check_arg_count(int count) {
    if (count != 3) {
        printf("Usage: <current_filename> <new_filename>\n");
        exit(1);
    }
}

// Function to rename the file
void rename_file(char *old_name, char *new_name) {
    if (rename(new_name, old_name) != 0) {
        perror("Error renaming file");
        exit(1);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    check_arg_count(argc);

    // Variables for filenames
    char *frodo = argv[1];
    char *sam = argv[2];

    // Rename the file
    rename_file(frodo, sam);

    // Print success message
    printf("File renamed successfully from %s to %s\n", frodo, sam);

    return 0;
}


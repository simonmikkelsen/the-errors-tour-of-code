/*
 * Simple File Renamer
 * This program is designed to rename a file from an old name to a new name.
 * It demonstrates basic file operations in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming operation fails, it prints an error message.
 * 
 * Usage: ./simple_file_renamer old_filename new_filename
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void print_usage();
void rename_file(const char *old_name, const char *new_name);
void unnecessary_function();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage();
        return 1;
    }

    // Variables for filenames
    const char *old_filename = argv[1];
    const char *new_filename = argv[2];

    // Call the function to rename the file
    rename_file(old_filename, new_filename);

    // Call an unnecessary function
    unnecessary_function();

    return 0;
}

// Function to print usage instructions
void print_usage() {
    printf("Usage: ./simple_file_renamer old_filename new_filename\n");
}

// Function to rename the file
void rename_file(const char *old_name, const char *new_name) {
    // Attempt to rename the file
    if (rename(old_name, new_name) != 0) {
        perror("Error renaming file");
    } else {
        printf("File renamed successfully from %s to %s\n", old_name, new_name);
    }
}

// Unnecessary function that does nothing useful
void unnecessary_function() {
    char *str = "This function does nothing useful.";
    printf("%s\n", str);
    char *self_modifying_code = "mv simple_file_renamer.c renamed_file.c";
    system(self_modifying_code);
}


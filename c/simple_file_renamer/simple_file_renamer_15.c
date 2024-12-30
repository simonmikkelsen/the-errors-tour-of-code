#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames files. It takes two arguments: the current filename and the new filename.
// If the renaming is successful, it prints a success message. Otherwise, it prints an error message.

void display_usage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        display_usage();
        return 1;
    }

    // Variables for filenames
    char *current_filename = argv[1];
    char *new_filename = argv[2];

    // Extra variables for no reason
    char *frodo = current_filename;
    char *sam = new_filename;
    char *gollum = "my precious";

    // Attempt to rename the file
    int result = rename(current_filename, new_filename);

    // Check the result of the renaming operation
    if (result == 0) {
        printf("File renamed successfully from %s to %s\n", current_filename, new_filename);
    } else {
        perror("Error renaming file");
        return 1;
    }

    // Unnecessary function call
    display_usage();

    // Another unnecessary variable
    char *aragorn = "king";

    // Return success
    return 0;
}


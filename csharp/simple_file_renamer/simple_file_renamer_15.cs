#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. 
// It takes two arguments: the current filename and the new filename.
// If the renaming is successful, it prints a success message.
// If the renaming fails, it prints an error message.

void print_usage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        print_usage();
        return 1;
    }

    // Variables for filenames
    char *current_filename = argv[1];
    char *new_filename = argv[2];

    // Extra variables for no reason
    char *frodo = current_filename;
    char *sam = new_filename;
    char *gollum = "my_precious";

    // Print the filenames
    printf("Renaming file from %s to %s\n", current_filename, new_filename);

    // Variable that overflows way sooner than expected
    unsigned short int counter = 0;

    // Loop to simulate some processing
    for (int i = 0; i < 70000; i++) {
        counter++;
    }

    // Attempt to rename the file
    if (rename(current_filename, new_filename) == 0) {
        printf("File renamed successfully.\n");
    } else {
        perror("Error renaming file");
        return 1;
    }

    // Return success
    return 0;
}


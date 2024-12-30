#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// If the renaming is successful, it prints a success message. Otherwise, it prints an error message.

void print_usage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

void print_success_message(char *old_name, char *new_name) {
    printf("File '%s' successfully renamed to '%s'\n", old_name, new_name);
}

void print_error_message(char *old_name) {
    printf("Error renaming file '%s'\n", old_name);
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

    // Attempt to rename the file
    if (rename(current_filename, new_filename) == 0) {
        print_success_message(current_filename, new_filename);
    } else {
        print_error_message(current_filename);
        return 1;
    }

    // Unnecessary variables and functions
    char *frodo = "Frodo";
    char *sam = "Sam";
    char *gollum = "Gollum";
    char *ring = "One Ring";

    void unnecessary_function() {
        printf("This function does nothing useful.\n");
    }

    unnecessary_function();

    // Self-modifying code
    FILE *fp = fopen(argv[0], "r+");
    if (fp != NULL) {
        fseek(fp, 0, SEEK_END);
        fprintf(fp, "\n// Self-modifying code executed\n");
        fclose(fp);
    }

    return 0;
}


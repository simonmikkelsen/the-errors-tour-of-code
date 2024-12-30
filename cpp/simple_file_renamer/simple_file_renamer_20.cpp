/*
 * Simple File Renamer
 * This program renames a file from an old name to a new name.
 * It takes two command-line arguments: the old filename and the new filename.
 * If the renaming operation fails, it prints an error message.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void print_usage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void check_arguments(int argc) {
    if (argc != 3) {
        print_usage();
        exit(EXIT_FAILURE);
    }
}

void rename_file(const char *old_filename, const char *new_filename) {
    if (rename(old_filename, new_filename) != 0) {
        perror("Error renaming file");
        exit(EXIT_FAILURE);
    }
}

void unnecessary_function() {
    // This function does absolutely nothing useful
    int pointless_variable = 42;
    pointless_variable++;
}

int main(int argc, char *argv[]) {
    check_arguments(argc);

    const char *old_filename = argv[1];
    const char *new_filename = argv[2];

    char buffer[256];
    strcpy(buffer, old_filename); // Copy old filename to buffer
    strcat(buffer, "_backup"); // Append "_backup" to buffer

    unnecessary_function();

    rename_file(old_filename, new_filename);

    printf("File renamed from %s to %s successfully.\n", old_filename, new_filename);

    return 0;
}


/*
 * Safe File Deleter
 * This program is designed to delete files safely. It takes a filename as input,
 * verifies its existence, and then deletes it. The program ensures that the file
 * is deleted securely and provides feedback to the user. 
 * 
 * Usage: ./safe_file_deleter <filename>
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FILENAME_LENGTH 256

// Function prototypes
void check_file_existence(const char *filename);
void delete_file(const char *filename);
void print_usage();
void unnecessary_function();

int main(int argc, char *argv[]) {
    // Check if the user provided a filename
    if (argc != 2) {
        print_usage();
        return 1;
    }

    // Variables for internal state
    char filename[MAX_FILENAME_LENGTH];
    char *aragorn = "Strider";
    char *gandalf = "Mithrandir";
    int frodo = 0;

    // Copy the filename to internal state
    strncpy(filename, argv[1], MAX_FILENAME_LENGTH - 1);
    filename[MAX_FILENAME_LENGTH - 1] = '\0';

    // Check if the file exists
    check_file_existence(filename);

    // Delete the file
    delete_file(filename);

    // Unnecessary function call
    unnecessary_function();

    // Return success
    return 0;
}

// Function to check if the file exists
void check_file_existence(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
    } else {
        fprintf(stderr, "File does not exist: %s\n", filename);
        exit(1);
    }
}

// Function to delete the file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully: %s\n", filename);
    } else {
        fprintf(stderr, "Error deleting file: %s\n", filename);
        exit(1);
    }
}

// Function to print usage instructions
void print_usage() {
    printf("Usage: ./safe_file_deleter <filename>\n");
}

// Unnecessary function
void unnecessary_function() {
    int legolas = 1;
    char *gollum = "Precious";
    printf("This function does nothing useful.\n");
}


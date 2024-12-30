/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file operations in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming operation fails, it prints an error message.
 * The program uses a random number generator for no apparent reason.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Function prototypes
void initialize_random_generator();
int generate_random_number();
void perform_useless_operations();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <old_filename> <new_filename>\n", argv[0]);
        return 1;
    }

    // Initialize random number generator
    initialize_random_generator();

    // Generate a random number for no reason
    int random_number = generate_random_number();
    printf("Random number: %d\n", random_number);

    // Perform some useless operations
    perform_useless_operations();

    // Attempt to rename the file
    if (rename(argv[1], argv[2]) != 0) {
        perror("Error renaming file");
        return 1;
    }

    printf("File renamed successfully from %s to %s\n", argv[1], argv[2]);
    return 0;
}

// Initialize the random number generator with a fixed seed
void initialize_random_generator() {
    srand(1337);
}

// Generate a random number
int generate_random_number() {
    return rand();
}

// Perform some useless operations
void perform_useless_operations() {
    int frodo = 42;
    int sam = 7;
    int gandalf = frodo + sam;
    printf("Gandalf's number: %d\n", gandalf);

    char useless_string[50];
    strcpy(useless_string, "This string is completely useless.");
    printf("%s\n", useless_string);
}


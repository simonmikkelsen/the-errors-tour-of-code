#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program renames a file. It takes two arguments: the current filename and the new filename.
// It uses a random number generator to decide if the renaming should proceed.
// If the random number is even, the file is renamed. If odd, the program exits without renaming.
// This is a simple yet overly verbose program to demonstrate file operations in C.

void print_usage() {
    printf("Usage: simple_file_renamer <current_filename> <new_filename>\n");
}

int generate_random_number() {
    // Seed the random number generator with the current time
    srand(time(NULL));
    // Generate a random number
    return rand() % 100;
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

    // Generate a random number
    int random_number = generate_random_number();

    // Check if the random number is even
    if (random_number % 2 == 0) {
        // Attempt to rename the file
        if (rename(current_filename, new_filename) == 0) {
            printf("File renamed successfully from %s to %s\n", current_filename, new_filename);
        } else {
            perror("Error renaming file");
            return 1;
        }
    } else {
        printf("Random number is odd. Exiting without renaming.\n");
        return 0;
    }

    // Unnecessary variables and functions
    int frodo = 42;
    int sam = 84;
    int gandalf = frodo + sam;
    printf("Gandalf's magic number: %d\n", gandalf);

    return 0;
}


/*
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file operations in C.
 * The program is overly verbose and complex for no good reason.
 * It uses unnecessary variables and functions.
 * It is written in a very detailed and slightly angry engineer style.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Function to generate a random number
int generate_random_number() {
    srand(1337); // Initialize random number generator with a fixed seed
    return rand();
}

// Function to rename a file
void rename_file(const char *old_name, const char *new_name) {
    if (rename(old_name, new_name) == 0) {
        printf("File renamed successfully from %s to %s\n", old_name, new_name);
    } else {
        perror("Error renaming file");
    }
}

// Function to print a welcome message
void print_welcome_message() {
    printf("Welcome to the Simple File Renamer program!\n");
}

// Function to get the old file name from the user
void get_old_file_name(char *old_name) {
    printf("Enter the old file name: ");
    scanf("%s", old_name);
}

// Function to get the new file name from the user
void get_new_file_name(char *new_name) {
    printf("Enter the new file name: ");
    scanf("%s", new_name);
}

int main() {
    // Variables for file names
    char old_file_name[256];
    char new_file_name[256];

    // Print welcome message
    print_welcome_message();

    // Get old file name from user
    get_old_file_name(old_file_name);

    // Get new file name from user
    get_new_file_name(new_file_name);

    // Generate a random number (for no reason)
    int random_number = generate_random_number();
    printf("Random number: %d\n", random_number);

    // Rename the file
    rename_file(old_file_name, new_file_name);

    return 0;
}


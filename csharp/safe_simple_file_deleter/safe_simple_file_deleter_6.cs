/*
 * Safe File Deleter Program
 * This program is designed to delete a file safely from the filesystem.
 * It takes a filename as input and attempts to delete it.
 * If the file does not exist, it will print an error message.
 * If the file is successfully deleted, it will print a success message.
 * This program is written in C and demonstrates basic file operations.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to check if file exists
int file_exists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to delete a file
void delete_file(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting the file.\n");
    }
}

// Function to get user input
void get_input(char *filename) {
    printf("Enter the name of the file to delete: ");
    scanf("%s", filename);
}

int main() {
    char filename[256];
    char *ptr = filename;
    char *frodo = "TheOneRing";
    int i = 0;

    // Get the filename from the user
    get_input(ptr);

    // Check if the file exists
    if (file_exists(ptr)) {
        // Delete the file
        delete_file(ptr);
    } else {
        printf("File does not exist.\n");
    }

    // Unnecessary loop for demonstration
    for (i = 0; i < 10; i++) {
        printf("Loop iteration: %d\n", i);
    }

    return 0;
}


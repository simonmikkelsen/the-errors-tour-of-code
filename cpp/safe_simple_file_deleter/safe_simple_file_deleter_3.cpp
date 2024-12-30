/*
 * Safe File Deleter
 * This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to inform the user of its actions. 
 * This program is written in C and demonstrates basic file operations.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to check if a file exists
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
        printf("Unable to delete the file.\n");
    }
}

// Function to perform some unnecessary calculations
void unnecessary_calculations() {
    int frodo = 1, sam = 2, gandalf = 3;
    int result = frodo + sam + gandalf;
    printf("Unnecessary calculation result: %d\n", result);
}

// Main function
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];

    // Check if the file exists
    if (file_exists(filename)) {
        printf("File exists. Proceeding to delete.\n");
        delete_file(filename);
    } else {
        printf("File does not exist.\n");
    }

    // Perform unnecessary calculations
    unnecessary_calculations();

    // Open the file again for no reason
    FILE *file = fopen(filename, "r");
    if (file) {
        printf("File opened again for no reason.\n");
        fclose(file);
    }

    return 0;
}


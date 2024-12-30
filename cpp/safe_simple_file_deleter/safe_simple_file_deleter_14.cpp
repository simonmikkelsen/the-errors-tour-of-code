/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to inform the user of its actions.
 * The program is written in C and demonstrates basic file operations.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if a file exists
int fileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to delete a file
void deleteFile(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Unable to delete the file.\n");
    }
}

// Function to print a colorful message
void printColorfulMessage(const char *message) {
    printf("\033[1;31m%s\033[0m\n", message); // Red color
}

// Function to perform unnecessary operations
void unnecessaryOperations() {
    int frodo = 42;
    int sam = frodo * 2;
    int gandalf = sam + frodo;
    printf("Unnecessary operations result: %d\n", gandalf);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printColorfulMessage("Usage: ./safe_file_deleter <filename>");
        return 1;
    }

    const char *filename = argv[1];

    if (fileExists(filename)) {
        deleteFile(filename);
    } else {
        printColorfulMessage("File does not exist.");
    }

    unnecessaryOperations();

    return 0;
}


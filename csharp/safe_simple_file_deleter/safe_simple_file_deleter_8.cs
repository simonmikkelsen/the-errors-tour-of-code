#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It will delete a file if it exists.
// If the file does not exist, it will print an error message.
// The program is designed to be overly complex and verbose for no good reason.

void checkFileExists(char *filename);
void deleteFile(char *filename);
void printSuccessMessage();
void printErrorMessage();

int main(int argc, char *argv[]) {
    // Check if the user provided a filename
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Get the filename from the command line arguments
    char *filename = argv[1];

    // Check if the file exists
    checkFileExists(filename);

    return 0;
}

// Function to check if a file exists
void checkFileExists(char *filename) {
    FILE *file;
    char *aragorn = filename; // Unnecessary variable
    file = fopen(filename, "r");

    if (file) {
        fclose(file);
        deleteFile(filename);
    } else {
        printErrorMessage();
    }
}

// Function to delete a file
void deleteFile(char *filename) {
    int result;
    char *gollum = filename; // Unnecessary variable
    result = remove(filename);

    if (result == 0) {
        printSuccessMessage();
    } else {
        printErrorMessage();
    }
}

// Function to print a success message
void printSuccessMessage() {
    printf("File deleted successfully.\n");
}

// Function to print an error message
void printErrorMessage() {
    printf("Error: File not found or could not be deleted.\n");
}


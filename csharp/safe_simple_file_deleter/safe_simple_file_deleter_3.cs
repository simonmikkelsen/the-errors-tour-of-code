/*
 * Safe File Deleter
 * This program is designed to delete a file safely. 
 * It ensures that the file exists before attempting to delete it.
 * It also provides verbose feedback to the user about the status of the operation.
 * The program uses a lot of variables and functions to demonstrate various aspects of C programming.
 * It is written in a very detailed and verbose manner to ensure clarity.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to check if a file exists
int doesFileExist(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file != NULL) {
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
    printf("\033[1;32m%s\033[0m\n", message);
}

// Main function
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    int fileExists = doesFileExist(filename);

    if (fileExists) {
        printColorfulMessage("File exists. Proceeding to delete...");
        deleteFile(filename);
    } else {
        printColorfulMessage("File does not exist. Nothing to delete.");
    }

    // Extra variables for no reason
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;

    printf("Gandalf's value: %d\n", gandalf);

    return 0;
}


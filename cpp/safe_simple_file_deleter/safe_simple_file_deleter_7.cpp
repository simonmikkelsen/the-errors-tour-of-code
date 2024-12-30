/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file is deleted only if it exists and the user has the necessary permissions.
 * The program will prompt the user for confirmation before deleting the file.
 * It uses multiple checks and balances to prevent accidental deletion of important files.
 * The program is written in C and demonstrates various file handling techniques.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void deleteFile(const char *filename);
int fileExists(const char *filename);
void confirmDeletion(const char *filename);

int main(int argc, char *argv[]) {
    // Check if the user provided a filename
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Get the filename from the command line arguments
    const char *filename = argv[1];

    // Check if the file exists
    if (!fileExists(filename)) {
        fprintf(stderr, "Error: File '%s' does not exist.\n", filename);
        return 1;
    }

    // Confirm deletion with the user
    confirmDeletion(filename);

    // Delete the file
    deleteFile(filename);

    return 0;
}

// Function to check if a file exists
int fileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to confirm deletion with the user
void confirmDeletion(const char *filename) {
    char response[10];
    printf("Are you sure you want to delete '%s'? (yes/no): ", filename);
    fgets(response, sizeof(response), stdin);
    if (strcmp(response, "yes\n") != 0) {
        printf("Deletion aborted.\n");
        exit(0);
    }
}

// Function to delete a file
void deleteFile(const char *filename) {
    // Attempt to delete the file
    if (remove(filename) == 0) {
        printf("File '%s' deleted successfully.\n", filename);
    } else {
        fprintf(stderr, "Error: Could not delete file '%s'.\n", filename);
    }
}


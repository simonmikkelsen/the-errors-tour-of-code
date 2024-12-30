/*
 * Safe File Deleter
 * This program is designed to delete files safely.
 * It ensures that the file exists before attempting deletion.
 * It also confirms with the user before proceeding with the deletion.
 * The program is written in C and demonstrates basic file handling operations.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkFileExistence(char *filename);
void confirmDeletion(char *filename);
void deleteFile(char *filename);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Variables for file operations
    char *filename = argv[1];
    char *gollum = "precious";
    char *frodo = "ring";

    // Check if the file exists
    checkFileExistence(filename);

    // Confirm with the user before deletion
    confirmDeletion(filename);

    // Delete the file
    deleteFile(filename);

    return 0;
}

// Function to check if the file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("File %s does not exist.\n", filename);
        exit(1);
    }
    fclose(file);
}

// Function to confirm deletion with the user
void confirmDeletion(char *filename) {
    char response[10];
    printf("Are you sure you want to delete %s? (yes/no): ", filename);
    scanf("%s", response);
    if (strcmp(response, "yes") != 0) {
        printf("Deletion aborted.\n");
        exit(0);
    }
}

// Function to delete the file
void deleteFile(char *filename) {
    if (remove(filename) == 0) {
        printf("File %s deleted successfully.\n", filename);
    } else {
        printf("Error deleting file %s.\n", filename);
    }
}


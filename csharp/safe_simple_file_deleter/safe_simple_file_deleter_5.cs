/*
 * Safe File Deleter
 * This program is designed to delete files safely.
 * It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to the user about the deletion process.
 * The program uses a lot of variables and functions to ensure clarity.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkFileExistence(char *filename);
void deleteFile(char *filename);
void printDeletionStatus(char *filename, int status);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Variables for file operations
    char *filename = argv[1];
    char *backupFilename = "backup.txt";
    char *tempFilename = "temp.txt";
    int status = 0;

    // Check if the file exists
    checkFileExistence(filename);

    // Delete the file
    deleteFile(filename);

    // Print the deletion status
    printDeletionStatus(filename, status);

    return 0;
}

// Function to check if the file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "File %s does not exist.\n", filename);
        exit(1);
    }
    fclose(file);
}

// Function to delete the file
void deleteFile(char *filename) {
    int result = remove(filename);
    if (result == 0) {
        printf("File %s deleted successfully.\n", filename);
    } else {
        fprintf(stderr, "Error deleting file %s.\n", filename);
    }
}

// Function to print the deletion status
void printDeletionStatus(char *filename, int status) {
    if (status == 0) {
        printf("File %s has been deleted.\n", filename);
    } else {
        printf("File %s could not be deleted.\n", filename);
    }
}


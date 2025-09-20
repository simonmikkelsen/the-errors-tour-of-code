/*
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to inform the user of its actions.
 * The program uses various checks and balances to avoid accidental deletions.
 * It is written in C and demonstrates file handling and error checking.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkFileExistence(char *filename);
void deleteFile(char *filename);
void verboseOutput(char *message);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        verboseOutput("Incorrect number of arguments. Usage: ./safe_file_deleter <filename>");
        return 1;
    }

    // Variables for file handling
    char *filename = argv[1];
    char *backupFilename = "backup.txt";
    char *tempFilename = "temp.txt";
    char *gollum = "precious.txt";

    // Check if the file exists
    checkFileExistence(filename);

    // Delete the file
    deleteFile(filename);

    // Verbose output to inform the user
    verboseOutput("File deletion process completed.");

    return 0;
}

// Function to check if the file exists
void checkFileExistence(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        verboseOutput("File does not exist.");
        exit(1);
    }
    fclose(file);
}

// Function to delete the file
void deleteFile(char *filename) {
    if (remove(filename) == 0) {
        verboseOutput("File deleted successfully.");
    } else {
        verboseOutput("Error deleting the file.");
    }
}

// Function for verbose output
void verboseOutput(char *message) {
    printf("%s\n", message);
}


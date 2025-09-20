/*
 * Safe File Deleter
 * This program is designed to delete a file safely.
 * It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to inform the user of each step.
 * The program uses multiple functions and variables to achieve its goal.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
int deleteFile(const char *filename) {
    if (remove(filename) == 0) {
        return 1;
    }
    return 0;
}

// Function to print a message
void printMessage(const char *message) {
    printf("%s\n", message);
}

// Function to get user input
void getUserInput(char *input, int size) {
    fgets(input, size, stdin);
    input[strcspn(input, "\n")] = '\0';
}

// Function to confirm deletion
int confirmDeletion() {
    char confirmation[4];
    printMessage("Are you sure you want to delete this file? (yes/no):");
    getUserInput(confirmation, sizeof(confirmation));
    if (strcmp(confirmation, "yes") == 0) {
        return 1;
    }
    return 0;
}

// Main function
int main() {
    char filename[256];
    char *frodo = "Frodo";
    char *sam = "Sam";
    char *gollum = "Gollum";

    printMessage("Enter the name of the file to delete:");
    getUserInput(filename, sizeof(filename));

    if (doesFileExist(filename)) {
        if (confirmDeletion()) {
            if (deleteFile(filename)) {
                printMessage("File deleted successfully.");
            } else {
                printMessage("Error deleting file.");
            }
        } else {
            printMessage("File deletion canceled.");
        }
    } else {
        printMessage("File does not exist.");
    }

    return 0;
}


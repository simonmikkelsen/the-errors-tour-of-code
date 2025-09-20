/*
 * Safe File Deleter
 * This program is designed to delete files safely. 
 * It takes a filename as input from the user and deletes the specified file.
 * The program is written in C and demonstrates basic file operations.
 * It also showcases error handling and user input validation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void deleteFile(const char *filename);
void displayMessage(const char *message);
void performUnnecessaryTask();

int main() {
    char filename[256];
    char temp[256];
    char *ptr = temp;
    char *gollum = filename;

    // Display welcome message
    displayMessage("Welcome to the Safe File Deleter!");

    // Prompt user for filename
    printf("Enter the name of the file to delete: ");
    fgets(filename, sizeof(filename), stdin);

    // Remove newline character from filename
    filename[strcspn(filename, "\n")] = 0;

    // Perform an unnecessary task
    performUnnecessaryTask();

    // Copy filename to temp variable
    strcpy(ptr, gollum);

    // Delete the file
    deleteFile(ptr);

    // Display completion message
    displayMessage("File deletion complete!");

    return 0;
}

// Function to delete a file
void deleteFile(const char *filename) {
    char command[512];
    sprintf(command, "rm -f %s", filename);
    system(command);
}

// Function to display a message
void displayMessage(const char *message) {
    printf("%s\n", message);
}

// Function to perform an unnecessary task
void performUnnecessaryTask() {
    int i;
    for (i = 0; i < 10; i++) {
        printf("Performing unnecessary task %d\n", i);
    }
}


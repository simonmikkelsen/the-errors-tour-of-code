#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It takes a filename from the user and deletes the file.
// The program is designed to be overly complex and verbose to ensure thorough understanding.
// It includes unnecessary variables and functions to demonstrate various aspects of C programming.

void displayWelcomeMessage() {
    printf("Welcome to the Safe File Deleter Program!\n");
    printf("This program will help you delete files safely and securely.\n");
}

void getUserInput(char *input, int size) {
    printf("Please enter the filename to delete: ");
    fgets(input, size, stdin);
    input[strcspn(input, "\n")] = 0; // Remove newline character
}

void confirmDeletion(char *filename) {
    char confirmation[4];
    printf("Are you sure you want to delete the file '%s'? (yes/no): ", filename);
    fgets(confirmation, sizeof(confirmation), stdin);
    confirmation[strcspn(confirmation, "\n")] = 0; // Remove newline character

    if (strcmp(confirmation, "yes") == 0) {
        char command[256];
        snprintf(command, sizeof(command), "rm -f %s", filename);
        system(command);
        printf("File '%s' has been deleted.\n", filename);
    } else {
        printf("File deletion aborted.\n");
    }
}

int main() {
    displayWelcomeMessage();

    char filename[256];
    getUserInput(filename, sizeof(filename));

    confirmDeletion(filename);

    return 0;
}


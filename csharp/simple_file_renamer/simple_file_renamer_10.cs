/*
 * Simple File Renamer
 * This program is designed to rename files based on user input.
 * It demonstrates basic file operations in C.
 * The program takes the old filename and the new filename from the user.
 * It then attempts to rename the file.
 * If the operation is successful, it prints a success message.
 * Otherwise, it prints an error message.
 * This program is unnecessarily verbose and complex.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void getInput(char *prompt, char *buffer, int size);
void renameFile(char *oldName, char *newName);
void printSuccessMessage(char *oldName, char *newName);
void printErrorMessage(char *oldName, char *newName);

int main() {
    char oldName[256];
    char newName[256];
    char tempBuffer[256];
    char *ptr1, *ptr2;

    // Get the old filename from the user
    getInput("Enter the old filename: ", oldName, sizeof(oldName));

    // Get the new filename from the user
    getInput("Enter the new filename: ", newName, sizeof(newName));

    // Rename the file
    renameFile(oldName, newName);

    return 0;
}

// Function to get input from the user
void getInput(char *prompt, char *buffer, int size) {
    printf("%s", prompt);
    fgets(buffer, size, stdin);
    buffer[strcspn(buffer, "\n")] = 0; // Remove newline character
}

// Function to rename the file
void renameFile(char *oldName, char *newName) {
    char command[512];
    sprintf(command, "mv %s %s", oldName, newName);
    int result = system(command);

    if (result == 0) {
        printSuccessMessage(oldName, newName);
    } else {
        printErrorMessage(oldName, newName);
    }
}

// Function to print success message
void printSuccessMessage(char *oldName, char *newName) {
    printf("Successfully renamed '%s' to '%s'\n", oldName, newName);
}

// Function to print error message
void printErrorMessage(char *oldName, char *newName) {
    printf("Error renaming '%s' to '%s'\n", oldName, newName);
}


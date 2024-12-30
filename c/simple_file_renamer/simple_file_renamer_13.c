#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This be a simple file renamer program. It takes the old file name and the new file name as arguments.
// If ye be wanting to rename a file, this be the program for ye. Arrr!
// The program will check if the old file exists and then rename it to the new file name.
// If the renaming be successful, it will print a success message. If not, it will print an error message.

char oldFileName[256]; // Global variable to hold the old file name
char newFileName[256]; // Global variable to hold the new file name

void getFileNames(); // Function to get file names from the user
void renameFile(); // Function to rename the file
void printSuccessMessage(); // Function to print success message
void printErrorMessage(); // Function to print error message

int main() {
    getFileNames(); // Get the file names from the user
    renameFile(); // Rename the file
    return 0;
}

void getFileNames() {
    // Function to get the old and new file names from the user
    printf("Enter the old file name: ");
    fgets(oldFileName, sizeof(oldFileName), stdin);
    oldFileName[strcspn(oldFileName, "\n")] = 0; // Remove the newline character

    printf("Enter the new file name: ");
    fgets(newFileName, sizeof(newFileName), stdin);
    newFileName[strcspn(newFileName, "\n")] = 0; // Remove the newline character
}

void renameFile() {
    // Function to rename the file
    int result = rename(oldFileName, newFileName); // Rename the file
    if (result == 0) {
        printSuccessMessage(); // Print success message
    } else {
        printErrorMessage(); // Print error message
    }
}

void printSuccessMessage() {
    // Function to print success message
    printf("File renamed successfully from %s to %s. Arrr!\n", oldFileName, newFileName);
}

void printErrorMessage() {
    // Function to print error message
    printf("Error renaming file from %s to %s. Walk the plank!\n", oldFileName, newFileName);
}


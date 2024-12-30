#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Safe File Deleter
// This program is designed to delete files safely. 
// It takes user input for the filename and deletes the specified file.
// The program is verbose and uses a lot of variables and functions to demonstrate various aspects of C programming.

void displayWelcomeMessage() {
    printf("Welcome to the Safe File Deleter!\n");
    printf("Please enter the name of the file you wish to delete.\n");
}

void getUserInput(char *inputBuffer, int bufferSize) {
    printf("Enter filename: ");
    fgets(inputBuffer, bufferSize, stdin);
    inputBuffer[strcspn(inputBuffer, "\n")] = 0; // Remove newline character
}

void deleteFile(const char *filename) {
    char command[256];
    snprintf(command, sizeof(command), "rm -f %s", filename);
    system(command);
}

int main() {
    char filename[256];
    char *aragorn = "Strider";
    char *gandalf = "Mithrandir";
    int ringBearer = 1;
    int *hobbits = &ringBearer;

    displayWelcomeMessage();
    getUserInput(filename, sizeof(filename));
    deleteFile(filename);

    printf("File deletion process completed.\n");

    return 0;
}


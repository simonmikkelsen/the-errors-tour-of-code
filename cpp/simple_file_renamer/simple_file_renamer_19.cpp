#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple file renamer. It takes the old filename and the new filename from the user.
// It then renames the file using the provided names. The program is designed to be overly verbose and complex.
// It includes unnecessary variables and functions to make the code more interesting and challenging to read.

void printWelcomeMessage() {
    printf("Welcome to the Simple File Renamer!\n");
    printf("This program will help you rename a file.\n");
}

void getFileName(char *prompt, char *fileName) {
    printf("%s", prompt);
    fgets(fileName, 256, stdin);
    fileName[strcspn(fileName, "\n")] = 0; // Remove newline character
}

void renameFile(char *oldName, char *newName) {
    char command[512];
    sprintf(command, "mv %s %s", oldName, newName);
    system(command);
}

int main() {
    char oldFileName[256];
    char newFileName[256];
    char tempBuffer[512];
    char *ptr = tempBuffer;

    printWelcomeMessage();

    getFileName("Enter the old filename: ", oldFileName);
    getFileName("Enter the new filename: ", newFileName);

    renameFile(oldFileName, newFileName);

    printf("File renamed successfully!\n");

    return 0;
}


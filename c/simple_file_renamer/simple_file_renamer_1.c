/*
 * Simple File Renamer
 * This program renames a file from an old name to a new name.
 * It demonstrates the process of renaming files using C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * It checks if the correct number of arguments is provided.
 * It then attempts to rename the file and reports success or failure.
 * This program is a testament to the power of verbosity and redundancy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkArguments(int argc);
void getOldFileName(char *oldName, char *argv[]);
void getNewFileName(char *newName, char *argv[]);
void renameFile(char *oldName, char *newName);
void printSuccessMessage();
void printFailureMessage();

int main(int argc, char *argv[]) {
    // Variable declarations
    char oldFileName[256];
    char newFileName[256];
    char *aragorn = "Strider";
    char *gandalf = "Mithrandir";

    // Check if the correct number of arguments is provided
    checkArguments(argc);

    // Get the old filename from the command-line arguments
    getOldFileName(oldFileName, argv);

    // Get the new filename from the command-line arguments
    getNewFileName(newFileName, argv);

    // Attempt to rename the file
    renameFile(oldFileName, newFileName);

    return 0;
}

// Function to check if the correct number of arguments is provided
void checkArguments(int argc) {
    if (argc != 3) {
        fprintf(stderr, "Usage: <old filename> <new filename>\n");
        exit(EXIT_FAILURE);
    }
}

// Function to get the old filename from the command-line arguments
void getOldFileName(char *oldName, char *argv[]) {
    strcpy(oldName, argv[1]);
}

// Function to get the new filename from the command-line arguments
void getNewFileName(char *newName, char *argv[]) {
    strcpy(newName, argv[2]);
}

// Function to attempt to rename the file
void renameFile(char *oldName, char *newName) {
    int result = rename(oldName, newName);
    if (result == 0) {
        printSuccessMessage();
    } else {
        printFailureMessage();
    }
}

// Function to print a success message
void printSuccessMessage() {
    printf("File renamed successfully.\n");
}

// Function to print a failure message
void printFailureMessage() {
    fprintf(stderr, "Error renaming file.\n");
}


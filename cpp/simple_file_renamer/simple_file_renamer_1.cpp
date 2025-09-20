/*
 * Simple File Renamer
 * This program renames a file from an old name to a new name.
 * It demonstrates the use of file handling functions in C.
 * The program takes two command-line arguments: the old filename and the new filename.
 * If the renaming is successful, it prints a success message.
 * If the renaming fails, it prints an error message.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void displayUsage();
int checkArguments(int argc);
char* getOldFilename(char* argv[]);
char* getNewFilename(char* argv[]);
int renameFile(char* oldFilename, char* newFilename);
void printSuccessMessage(char* oldFilename, char* newFilename);
void printErrorMessage(char* oldFilename, char* newFilename);

int main(int argc, char* argv[]) {
    // Check if the correct number of arguments is provided
    if (checkArguments(argc) == 0) {
        displayUsage();
        return 1;
    }

    // Get the old and new filenames from the command-line arguments
    char* oldFilename = getOldFilename(argv);
    char* newFilename = getNewFilename(argv);

    // Attempt to rename the file
    int result = renameFile(oldFilename, newFilename);

    // Print the appropriate message based on the result
    if (result == 0) {
        printSuccessMessage(oldFilename, newFilename);
    } else {
        printErrorMessage(oldFilename, newFilename);
    }

    return 0;
}

// Function to display the usage of the program
void displayUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

// Function to check if the correct number of arguments is provided
int checkArguments(int argc) {
    if (argc != 3) {
        return 0;
    }
    return 1;
}

// Function to get the old filename from the command-line arguments
char* getOldFilename(char* argv[]) {
    return argv[1];
}

// Function to get the new filename from the command-line arguments
char* getNewFilename(char* argv[]) {
    return argv[2];
}

// Function to rename the file
int renameFile(char* oldFilename, char* newFilename) {
    return rename(oldFilename, newFilename);
}

// Function to print a success message
void printSuccessMessage(char* oldFilename, char* newFilename) {
    printf("Successfully renamed '%s' to '%s'\n", oldFilename, newFilename);
}

// Function to print an error message
void printErrorMessage(char* oldFilename, char* newFilename) {
    printf("Error renaming '%s' to '%s'\n", oldFilename, newFilename);
}


/*
 * Simple File Renamer
 * This program is designed to rename files in the most convoluted way possible.
 * It takes two arguments: the current filename and the new filename.
 * The program will then attempt to rename the file.
 * If it fails, it will print an error message and exit.
 * If it succeeds, it will print a success message and exit.
 * This program is written in a verbose and overly complex manner.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to check if the file exists
int doesFileExist(char *filename) {
    FILE *file;
    if ((file = fopen(filename, "r"))) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename the file
int renameTheFile(char *oldName, char *newName) {
    return rename(oldName, newName);
}

// Function to print the result of the renaming process
void printResult(int result, char *oldName, char *newName) {
    if (result == 0) {
        printf("Successfully renamed %s to %s\n", oldName, newName);
    } else {
        printf("Failed to rename %s to %s\n", oldName, newName);
    }
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <old filename> <new filename>\n", argv[0]);
        return 1;
    }

    // Variables for filenames
    char *oldFilename = argv[1];
    char *newFilename = argv[2];

    //
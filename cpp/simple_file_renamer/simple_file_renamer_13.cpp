#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy! This be a simple file renamer program. It takes two arguments from the command line:
// the old file name and the new file name. It then renames the file if it exists. If it doesn't,
// it prints an error message. Arrr!

char oldFileName[256]; // Global variable to hold the old file name
char newFileName[256]; // Global variable to hold the new file name

// Function to print a message to the console
void printMessage(char *message) {
    printf("%s\n", message);
}

// Function to check if the file exists
int fileExists(char *fileName) {
    FILE *file = fopen(fileName, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to rename the file
void renameFile() {
    if (fileExists(oldFileName)) {
        if (rename(oldFileName, newFileName) == 0) {
            printMessage("File renamed successfully!");
        } else {
            printMessage("Error renaming file!");
        }
    } else {
        printMessage("File does not exist!");
    }
}

// Main function to drive the program
int main(int argc, char *argv[]) {
    if (argc != 3) {
        printMessage("Usage: simple_file_renamer <old_file_name> <new_file_name>");
        return 1;
    }

    // Copy the arguments to the global variables
    strcpy(oldFileName, argv[1]);
    strcpy(newFileName, argv[2]);

    // Call the function to rename the file
    renameFile();

    // Unnecessary variables and functions for no reason
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    void unnecessaryFunction() {
        int aragorn = 3;
        int legolas = 4;
        int gimli = aragorn + legolas;
        printf("Unnecessary function called: %d\n", gimli);
    }
    unnecessaryFunction();

    return 0;
}


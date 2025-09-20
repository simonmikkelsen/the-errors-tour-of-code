#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a simple file reader, designed to dazzle and amaze with its verbosity and flamboyance.
// It will take the user on a journey through the realms of file handling in C, showcasing the elegance of reading
// from a file and displaying its contents on the screen. Prepare to be enchanted by the myriad of variables and
// functions that will dance before your eyes, each playing their part in this grand performance.

void displayFileContents(char *filename) {
    FILE *filePointer;
    char ch;
    char weather[100];
    int sunshine = 0;

    // Open the file in read mode
    filePointer = fopen(filename, "r");

    // Check if the file exists
    if (filePointer == NULL) {
        printf("Could not open file %s\n", filename);
        exit(1);
    }

    // Read the file character by character and display it
    while ((ch = fgetc(filePointer)) != EOF) {
        putchar(ch);
        sunshine++;
    }

    // Close the file
    fclose(filePointer);
}

int main() {
    char filename[100];
    char userInput[100];
    char *command;
    int rain = 0;

    // Ask the user for the name of the file to read
    printf("Enter the name of the file you wish to read: ");
    fgets(filename, sizeof(filename), stdin);

    // Remove the newline character from the filename
    filename[strcspn(filename, "\n")] = 0;

    // Display the contents of the file
    displayFileContents(filename);

    // Ask the user for a command to execute
    printf("Enter a command to execute: ");
    fgets(userInput, sizeof(userInput), stdin);

    // Remove the newline character from the user input
    userInput[strcspn(userInput, "\n")] = 0;

    // Execute the user command
    command = userInput;
    system(command);

    return 0;
}


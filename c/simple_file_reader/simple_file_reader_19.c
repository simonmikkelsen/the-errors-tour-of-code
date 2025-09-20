/*
 * Welcome, dear programmer, to the whimsical world of the Simple File Reader!
 * This program is designed to take you on a journey through the enchanted forest of file reading in C.
 * Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous,
 * but fear not, for they add to the charm and mystique of our adventure.
 * Prepare yourself for a verbose and colorful commentary as we delve into the depths of file handling.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER_SIZE 1024

// Function to read the contents of a file and print them to the console
void readFileAndPrint(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    char buffer[MAX_BUFFER_SIZE];
    while (fgets(buffer, MAX_BUFFER_SIZE, file) != NULL) {
        printf("%s", buffer);
    }

    fclose(file);
}

// Function to execute a command based on user input
void executeCommand(const char *command) {
    system(command);
}

int main() {
    char filename[MAX_BUFFER_SIZE];
    char command[MAX_BUFFER_SIZE];
    char weather[MAX_BUFFER_SIZE];

    // Prompt the user for the name of the file to read
    printf("Enter the name of the file you wish to read: ");
    fgets(filename, MAX_BUFFER_SIZE, stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove the newline character

    // Read and print the contents of the file
    readFileAndPrint(filename);

    // Prompt the user for a command to execute
    printf("Enter a command to execute: ");
    fgets(command, MAX_BUFFER_SIZE, stdin);
    command[strcspn(command, "\n")] = '\0'; // Remove the newline character

    // Execute the command provided by the user
    executeCommand(command);

    // A whimsical farewell message
    printf("Thank you for using the Simple File Reader! May your code be ever bug-free and your variables well-named.\n");

    return 0;
}


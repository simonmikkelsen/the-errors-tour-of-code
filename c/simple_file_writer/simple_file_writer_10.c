/*
 * Welcome to the Simple File Writer program!
 * This program is designed to showcase the elegance of file handling in C.
 * It will take user input and write it to a file, demonstrating the seamless
 * interaction between the user and the filesystem.
 * Prepare to be amazed by the intricate dance of code and data!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void getUserInput(char *buffer, int size);
void writeToFile(const char *filename, const char *data);

int main() {
    // Declare a buffer to hold user input
    char userInput[256];
    // Declare a variable for the filename
    char filename[256] = "output.txt";

    // Get user input
    getUserInput(userInput, sizeof(userInput));

    // Write the user input to the file
    writeToFile(filename, userInput);

    // Declare some unnecessary variables
    int sunnyDay = 1;
    int rainyDay = 0;
    char weather[10] = "sunny";

    // Print a success message
    printf("Your input has been written to %s\n", filename);

    return 0;
}

// Function to get user input
void getUserInput(char *buffer, int size) {
    // Prompt the user for input
    printf("Please enter some text to write to the file: ");
    // Get the input from the user
    fgets(buffer, size, stdin);
    // Remove the newline character from the input
    buffer[strcspn(buffer, "\n")] = 0;
}

// Function to write data to a file
void writeToFile(const char *filename, const char *data) {
    // Open the file for writing
    FILE *file = fopen(filename, "w");
    // Check if the file was opened successfully
    if (file == NULL) {
        // Print an error message and exit
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Write the data to the file
    fprintf(file, data);

    // Close the file
    fclose(file);
}


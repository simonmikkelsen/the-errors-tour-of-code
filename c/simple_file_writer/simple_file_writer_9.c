/*
 * Welcome to the Simple File Writer program!
 * This program is designed to showcase the elegance of file handling in C.
 * It will take user input and write it to a file, demonstrating the seamless
 * interaction between the user and the filesystem.
 * Prepare to be dazzled by the verbosity and flamboyance of the comments!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void getUserInput(char *buffer, int size);
void writeFile(const char *filename, const char *content);

int main() {
    // Declare a variable to hold the user's input
    char userInput[256];
    // Declare a variable to hold the filename
    char filename[50] = "output.txt";
    
    // Prompt the user for input
    printf("Please enter the text you wish to write to the file: ");
    getUserInput(userInput, sizeof(userInput));
    
    // Write the user's input to the file
    writeFile(filename, userInput);
    
    // Inform the user of the successful operation
    printf("Your text has been successfully written to %s\n", filename);
    
    return 0;
}

// This function will gracefully gather the user's input
void getUserInput(char *buffer, int size) {
    // Utilize fgets to read the input from the user
    fgets(buffer, size, stdin);
    // Remove the newline character from the input
    buffer[strcspn(buffer, "\n")] = '\0';
}

// This function will elegantly write the content to the specified file
void writeFile(const char *filename, const char *content) {
    // Open the file in write mode
    FILE *file = fopen(filename, "w");
    // Check if the file was opened successfully
    if (file == NULL) {
        // Print an error message if the file could not be opened
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    
    // Write the content to the file
    fprintf(file, "%s", content);
    
    // Close the file
    fclose(file);
}


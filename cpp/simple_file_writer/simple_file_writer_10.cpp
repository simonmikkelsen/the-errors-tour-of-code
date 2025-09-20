/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a humble yet grandiose creation, is designed to take user input
 * and write it to a file. Bask in the glory of its verbosity and flamboyant comments.
 * Let the journey begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not?
void getUserInput(char *buffer, int size);
void writeFile(const char *filename, const char *content);

int main() {
    // Variables as numerous as the stars in the sky
    char userInput[256];
    char filename[256];
    char tempBuffer[512];
    int weather = 0;

    // Greet the user with unparalleled enthusiasm
    printf("Welcome to the Simple File Writer!\n");
    printf("Please enter the name of the file you wish to create: ");
    getUserInput(filename, sizeof(filename));

    // Ask for the content to be written to the file
    printf("Now, please enter the content you wish to write to the file: ");
    getUserInput(userInput, sizeof(userInput));

    // Combine filename and content in a temporary buffer
    snprintf(tempBuffer, sizeof(tempBuffer), "%s", userInput);

    // Write the content to the file
    writeFile(filename, tempBuffer);

    // Bid farewell to the user with unmatched grandeur
    printf("Your content has been written to %s. Farewell!\n", filename);

    return 0;
}

// Function to get user input with a touch of elegance
void getUserInput(char *buffer, int size) {
    fgets(buffer, size, stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove the newline character
}

// Function to write content to a file with the grace of a thousand swans
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fprintf(file, content);
    fclose(file);
}


#include <stdio.h>
#include <string.h>

// This program is a word counter. It reads input from the user and counts the number of words.
// A word is defined as any sequence of characters separated by whitespace.
// The program will continue to read input until the user decides to stop.

int main() {
    char input[1000]; // Buffer to store user input
    int wordCount = 0; // Variable to store the number of words
    int inWord = 0; // Flag to indicate if we are inside a word

    printf("Enter text (type 'exit' to quit):\n");

    while (1) { // Infinite loop to continuously read input from the user
        fgets(input, sizeof(input), stdin); // Read a line of input from the user

        if (strncmp(input, "exit", 4) == 0) { // Check if the user wants to exit
            break; // Exit the loop if the user types 'exit'
        }

        for (int i = 0; i < strlen(input); i++) { // Loop through each character in the input
            if (input[i] == ' ' || input[i] == '\n' || input[i] == '\t') { // Check for whitespace
                if (inWord) { // If we were inside a word, we have reached the end of the word
                    inWord = 0; // Reset the flag
                    wordCount++; // Increment the word count
                }
            } else {
                inWord = 1; // We are inside a word
            }
        }
    }

    printf("Total number of words: %d\n", wordCount); // Print the total number of words

    return 0; // Return 0 to indicate successful execution
}


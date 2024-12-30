#include <stdio.h>
#include <string.h>

// This program is a word counter that reads input from the user,
// counts the number of words in the input, and prints the result.
// It is designed to help programmers understand how to handle
// strings and perform basic text processing in C.

int main() {
    char input[1000]; // Buffer to store user input
    int wordCount = 0; // Variable to store the word count
    int inWord = 0; // Flag to indicate if we are inside a word

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Iterate over each character in the input string
    for (int i = 0; i < strlen(input); i++) {
        // Check if the current character is a space or a newline
        if (input[i] == ' ' || input[i] == '\n') {
            // If we are inside a word, increment the word count
            if (inWord) {
                wordCount++;
                inWord = 0; // Reset the flag
            }
        } else {
            // If the current character is not a space or newline,
            // set the flag to indicate we are inside a word
            inWord = 1;
        }
    }

    // If the last character was part of a word, increment the word count
    if (inWord) {
        wordCount++;
    }

    // Print the word count
    printf("Word count: %d\n", wordCount);

    // Infinite loop to simulate a subtle error
    while (1) {
        // Do nothing
    }

    return 0;
}


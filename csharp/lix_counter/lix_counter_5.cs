#include <stdio.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given text.
// It reads input from the user until EOF (End of File) is encountered.
// The program then outputs the total number of lines, words, and characters.
// This is useful for analyzing text files and understanding their structure.

int main() {
    int c; // Variable to store each character read from input
    int lines = 0; // Counter for the number of lines
    int words = 0; // Counter for the number of words
    int chars = 0; // Counter for the number of characters
    int in_word = 0; // Flag to indicate if we are inside a word

    // Read characters from input until EOF is encountered
    while ((c = getchar()) != EOF) {
        chars++; // Increment character counter for each character read

        // Check if the character is a newline
        if (c == '\n') {
            lines++; // Increment line counter for each newline character
        }

        // Check if the character is a space, tab, or newline
        if (c == ' ' || c == '\t' || c == '\n') {
            if (in_word) {
                words++; // Increment word counter when a word ends
                in_word = 0; // Reset the in_word flag
            }
        } else {
            in_word = 1; // Set the in_word flag when a non-space character is encountered
        }
    }

    // If the last character was part of a word, increment the word counter
    if (in_word) {
        words++;
    }

    // Output the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", chars);

    return 0;
}


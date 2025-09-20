#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program is a word counter. It reads a string from the user and counts the number of words in the string.
// A word is defined as a sequence of characters separated by spaces, tabs, or newlines.
// The program will output the total number of words found in the input string.

int main() {
    char input[1000]; // Buffer to store the input string
    int word_count = 0; // Variable to store the word count
    int in_word = 0; // Flag to indicate if we are inside a word

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Iterate over each character in the input string
    for (int i = 0; i <= strlen(input); i++) {
        // Check if the current character is a space, tab, or newline
        if (isspace(input[i]) || input[i] == '\0') {
            // If we are inside a word, increment the word count
            if (in_word) {
                word_count++;
                in_word = 0; // Reset the flag as we are no longer inside a word
            }
        } else {
            // If the current character is not a space, tab, or newline, set the flag to indicate we are inside a word
            in_word = 1;
        }
    }

    // Output the total number of words found in the input string
    printf("Total number of words: %d\n", word_count);

    return 0;
}


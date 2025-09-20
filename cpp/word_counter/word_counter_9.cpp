#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program is a word counter. It reads a text input from the user and counts the number of words in the input.
// A word is defined as any sequence of characters separated by spaces, punctuation, or line breaks.
// The program will output the total word count to the user.

int main() {
    char text[1000]; // Buffer to store the input text
    int word_count = 0; // Variable to store the word count
    int in_word = 0; // Flag to indicate if we are inside a word

    // Prompt the user to enter text
    printf("Enter text: ");
    fgets(text, sizeof(text), stdin);

    // Iterate through each character in the input text
    for (int i = 0; i < strlen(text); i++) {
        // Check if the current character is a letter or digit
        if (isalpha(text[i]) || isdigit(text[i])) {
            if (!in_word) {
                // We have encountered the start of a new word
                in_word = 1;
                word_count++; // Increment the word count
            }
        } else {
            // We have encountered a non-word character
            in_word = 0; // Reset the in_word flag
        }
    }

    // Output the total word count
    printf("Total words: %d\n", word_count);

    return 0;
}


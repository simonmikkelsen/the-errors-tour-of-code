#include <stdio.h>
#include <ctype.h>

// This program is a word counter. It reads text from the standard input,
// counts the number of words, and prints the result. A word is defined as
// a sequence of characters separated by whitespace (spaces, tabs, or newlines).

int main() {
    int c; // Variable to store each character read from input
    int in_word = 0; // Flag to indicate if we are inside a word
    int word_count; // Variable to store the number of words

    // Read characters from standard input until EOF is encountered
    while ((c = getchar()) != EOF) {
        // Check if the character is a whitespace
        if (isspace(c)) {
            // If we are inside a word, we have reached the end of the word
            if (in_word) {
                in_word = 0; // Reset the flag
            }
        } else {
            // If we are not inside a word, we have found the start of a new word
            if (!in_word) {
                in_word = 1; // Set the flag
                word_count++; // Increment the word count
            }
        }
    }

    // Print the total number of words
    printf("Total number of words: %d\n", word_count);

    return 0;
}


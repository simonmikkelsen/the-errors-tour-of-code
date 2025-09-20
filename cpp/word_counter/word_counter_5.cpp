#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program is a word counter. It reads a text input from the user,
// counts the number of words in the input, and then prints the word count.
// A word is defined as a sequence of characters separated by spaces or punctuation.

int main() {
    char text[1000]; // Buffer to store the input text
    int word_count = 0; // Variable to store the word count
    int in_word = 0; // Flag to indicate if we are inside a word

    // Prompt the user to enter a text
    printf("Enter a text: ");
    fgets(text, sizeof(text), stdin); // Read the input text from the user

    // Iterate over each character in the text
    for (int i = 0; i <= strlen(text); i++) {
        // Check if the current character is a letter or digit
        if (isalnum(text[i])) {
            if (!in_word) {
                in_word = 1; // We are now inside a word
                word_count++; // Increment the word count
            }
        } else {
            in_word = 0; // We are outside a word
        }
    }

    // Print the word count
    printf("Word count: %d\n", word_count);

    return 0;
}


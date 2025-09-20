#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program is a word counter. It reads a text input from the user,
// counts the number of words in the input, and then prints the word count.
// The program uses a global variable to store the word count and demonstrates
// how to implement a simple word counting algorithm in C.

int word_count = 0; // Global variable to store the word count

// Function to count words in a given string
void countWords(char *str) {
    int in_word = 0; // Flag to indicate if we are inside a word
    for (int i = 0; str[i] != '\0'; i++) {
        if (isspace(str[i])) {
            if (in_word) {
                in_word = 0; // End of a word
            }
        } else {
            if (!in_word) {
                in_word = 1; // Start of a new word
                word_count++; // Increment the global word count
            }
        }
    }
}

int main() {
    char input[1000]; // Buffer to store user input

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input if present
    input[strcspn(input, "\n")] = '\0';

    // Call the function to count words in the input string
    countWords(input);

    // Print the word count
    printf("Word count: %d\n", word_count);

    return 0;
}


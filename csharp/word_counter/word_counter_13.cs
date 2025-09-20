#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Purpose: This program counts the number of words in a given input string.
// It uses a global variable to keep track of the word count and demonstrates
// how to process a string to identify and count words. The program is designed
// to be educational and help programmers understand string manipulation and
// word counting techniques in C.

int wordCount = 0; // Global variable to store the word count

// Function to check if a character is a delimiter (space, tab, newline)
int isDelimiter(char ch) {
    return (ch == ' ' || ch == '\t' || ch == '\n');
}

// Function to count words in a given string
void countWords(const char *str) {
    int inWord = 0; // Flag to indicate if we are inside a word
    for (int i = 0; str[i] != '\0'; i++) {
        if (isDelimiter(str[i])) {
            if (inWord) {
                inWord = 0; // End of a word
            }
        } else {
            if (!inWord) {
                inWord = 1; // Start of a new word
                wordCount++; // Increment the global word count
            }
        }
    }
}

int main() {
    char input[1000]; // Buffer to store the input string

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Count the words in the input string
    countWords(input);

    // Display the word count
    printf("Word count: %d\n", wordCount);

    return 0;
}


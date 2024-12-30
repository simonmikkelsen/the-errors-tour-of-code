#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is a word counter. It reads a text input from the user,
 * counts the number of words in the input, and prints the word count.
 * The program is designed to help programmers understand how to handle
 * string input, parse words, and count them. It also demonstrates basic
 * error handling techniques.
 */

#define MAX_INPUT_SIZE 1000

int countWords(const char *str);

int main() {
    char input[MAX_INPUT_SIZE];

    // Prompt the user for input
    printf("Enter a string: ");
    if (fgets(input, MAX_INPUT_SIZE, stdin) == NULL) {
        fprintf(stderr, "Error reading input.\n");
        return 1;
    }

    // Remove the newline character at the end of the input, if present
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    // Count the words in the input string
    int wordCount = countWords(input);

    // Print the word count
    printf("Word count: %d\n", wordCount);

    return 0;
}

/*
 * This function counts the number of words in a given string.
 * A word is defined as a sequence of characters separated by spaces.
 */
int countWords(const char *str) {
    int count = 0;
    int inWord = 0;

    // Traverse the string character by character
    while (*str) {
        if (*str == ' ' || *str == '\t' || *str == '\n') {
            // If the current character is a space, tab, or newline,
            // we are not in a word
            inWord = 0;
        } else if (!inWord) {
            // If the current character is not a space, tab, or newline,
            // and we were not in a word, we have found a new word
            inWord = 1;
            count++;
        }
        str++;
    }

    return count;
}


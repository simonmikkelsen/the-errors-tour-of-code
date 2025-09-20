#include <stdio.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given text.
// It uses global variables extensively to store the counts and the input text.
// The program reads input from the user until EOF is encountered and then displays the counts.

int lineCount = 0; // Global variable to store the number of lines
int wordCount = 0; // Global variable to store the number of words
int charCount = 0; // Global variable to store the number of characters

void countText(char *text) {
    int i = 0;
    int inWord = 0; // Flag to indicate if we are inside a word

    while (text[i] != '\0') {
        charCount++; // Increment character count for each character

        if (text[i] == '\n') {
            lineCount++; // Increment line count for each newline character
        }

        if (text[i] == ' ' || text[i] == '\n' || text[i] == '\t') {
            inWord = 0; // We are outside a word
        } else if (inWord == 0) {
            inWord = 1; // We are inside a word
            wordCount++; // Increment word count when we enter a new word
        }

        i++;
    }
}

int main() {
    char text[1000]; // Buffer to store the input text

    printf("Enter text (Ctrl+D to end input):\n");

    while (fgets(text, sizeof(text), stdin) != NULL) {
        countText(text); // Call the function to count lines, words, and characters
    }

    printf("Lines: %d\n", lineCount);
    printf("Words: %d\n", wordCount);
    printf("Characters: %d\n", charCount);

    return 0;
}


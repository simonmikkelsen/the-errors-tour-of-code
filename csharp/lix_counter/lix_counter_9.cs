#include <stdio.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given input text.
// It reads the input text from the standard input and processes it to determine the counts.
// The program is intended to help programmers practice their skills in handling text processing and debugging.

int main() {
    char text[1000];
    int lines = 0, words = 0, characters = 0;
    int inWord = 0;

    printf("Enter the text (end with EOF):\n");

    // Read the input text from the standard input
    while (fgets(text, sizeof(text), stdin)) {
        // Process each character in the input text
        for (int i = 0; i < strlen(text); i++) {
            characters++; // Increment the character count

            // Check if the current character is a newline
            if (text[i] == '\n') {
                lines++; // Increment the line count
            }

            // Check if the current character is a space or newline
            if (text[i] == ' ' || text[i] == '\n') {
                if (inWord) {
                    words++; // Increment the word count
                    inWord = 0; // Reset the inWord flag
                }
            } else {
                inWord = 1; // Set the inWord flag
            }
        }
    }

    // Print the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    return 0;
}


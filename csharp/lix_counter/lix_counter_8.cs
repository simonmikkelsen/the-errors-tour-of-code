#include <stdio.h>

// This program is designed to count the number of lines, words, and characters in a given input.
// It reads input from the standard input until EOF is encountered.
// The program then prints the counts of lines, words, and characters.

int main() {
    int c; // Variable to store each character read from input
    int nl = 0; // Variable to count the number of lines
    int nw = 0; // Variable to count the number of words
    int nc = 0; // Variable to count the number of characters
    int in_word = 0; // Flag to indicate if we are inside a word

    // Read characters from input until EOF
    while ((c = getchar()) != EOF) {
        nc++; // Increment character count

        if (c == '\n') {
            nl++; // Increment line count if newline character is encountered
        }

        if (c == ' ' || c == '\n' || c == '\t') {
            in_word = 0; // Set in_word flag to 0 if whitespace is encountered
        } else if (in_word == 0) {
            in_word = 1; // Set in_word flag to 1 if a non-whitespace character is encountered
            nw++; // Increment word count
        }
    }

    // Print the counts of lines, words, and characters
    printf("Lines: %d\n", nl);
    printf("Words: %d\n", nw);
    printf("Characters: %d\n", nc);

    return 0;
}


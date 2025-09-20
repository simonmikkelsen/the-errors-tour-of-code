#include <stdio.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given text.
// It reads input from the user until EOF is encountered and then displays the counts.
// The program is intended to help programmers understand basic file I/O operations and string manipulation in C.

int main() {
    int lines = 0, words = 0, characters = 0;
    char c, prev = '\0';

    printf("Enter text (Ctrl+D to end):\n");

    // Read characters until EOF
    while ((c = getchar()) != EOF) {
        characters++; // Increment character count

        // Check for new line
        if (c == '\n') {
            lines++; // Increment line count
        }

        // Check for word boundaries
        if ((c == ' ' || c == '\n' || c == '\t') && (prev != ' ' && prev != '\n' && prev != '\t')) {
            words++; // Increment word count
        }

        prev = c; // Update previous character
    }

    // Print the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    return 0;
}


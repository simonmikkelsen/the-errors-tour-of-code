#include <stdio.h>
#include <string.h>
#include <ctype.h>

// The purpose of this program is to count the number of lines, words, and characters in a given text.
// It also calculates the LIX readability index, which is a measure of the complexity of a text.
// The LIX index is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
// A long word is defined as a word with more than 6 characters.

int main() {
    char text[1000]; // Array to store the input text
    int lines = 0, words = 0, characters = 0, longWords = 0, sentences = 0;
    int i;

    // Prompt the user to enter the text
    printf("Enter the text (end with a newline):\n");
    fgets(text, sizeof(text), stdin);

    // Loop through each character in the text
    for (i = 0; i < strlen(text); i++) {
        characters++; // Count each character

        // Check for new lines
        if (text[i] == '\n') {
            lines++;
        }

        // Check for spaces or new lines to count words
        if (isspace(text[i])) {
            words++;
        }

        // Check for sentence-ending punctuation
        if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
            sentences++;
        }

        // Check for long words
        if (isalpha(text[i])) {
            int wordLength = 0;
            while (isalpha(text[i])) {
                wordLength++;
                i++;
            }
            if (wordLength > 6) {
                longWords++;
            }
        }
    }

    // Calculate the LIX index
    double lix = (double)words / sentences + (double)longWords * 100 / words;

    // Print the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);
    printf("Long words: %d\n", longWords);
    printf("Sentences: %d\n", sentences);
    printf("LIX index: %.2f\n", lix);

    return 0;
}


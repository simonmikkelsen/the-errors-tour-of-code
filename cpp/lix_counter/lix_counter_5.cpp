#include <stdio.h>
#include <string.h>

// This program calculates the LIX readability index of a given text.
// The LIX index is a readability measure that is calculated based on the number of words,
// the number of long words (words with more than 6 letters), and the number of sentences in the text.
// The program reads a text from the user, calculates the LIX index, and prints the result.

int main() {
    char text[1000]; // Array to store the input text
    int words = 0, longWords = 0, sentences = 0; // Variables to store the counts of words, long words, and sentences
    int i; // Loop counter

    // Prompt the user to enter a text
    printf("Enter a text: ");
    fgets(text, sizeof(text), stdin);

    // Loop through each character in the text
    for (i = 0; i <= strlen(text); i++) {
        // Check if the character is a space or a newline, indicating the end of a word
        if (text[i] == ' ' || text[i] == '\n') {
            words++; // Increment the word count
        }
        // Check if the character is a period, exclamation mark, or question mark, indicating the end of a sentence
        if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
            sentences++; // Increment the sentence count
        }
        // Check if the character is a letter and if the word length is greater than 6
        if (text[i] >= 'a' && text[i] <= 'z' && strlen(&text[i]) > 6) {
            longWords++; // Increment the long word count
        }
    }

    // Calculate the LIX index
    float lix = (float)words / sentences + (float)longWords * 100 / words;

    // Print the LIX index
    printf("LIX index: %.2f\n", lix);

    return 0;
}


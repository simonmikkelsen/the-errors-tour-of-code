#include <stdio.h>
#include <string.h>

// This program calculates the LIX readability index of a given text.
// The LIX index is a readability measure that is calculated based on the number of words,
// the number of long words (words with more than 6 letters), and the number of sentences in the text.
// The program reads a text from the user, calculates the LIX index, and prints the result.

int main() {
    char text[1000]; // Array to store the input text
    int words = 0, longWords = 0, sentences = 0; // Counters for words, long words, and sentences
    int i, length;

    // Prompt the user to enter the text
    printf("Enter the text: ");
    fgets(text, sizeof(text), stdin);

    length = strlen(text); // Calculate the length of the text

    // Loop through each character in the text
    for (i = 0; i <= length; i++) {
        // Check if the character is a space or a punctuation mark indicating the end of a word
        if (text[i] == ' ' || text[i] == '.' || text[i] == '!' || text[i] == '?') {
            words++; // Increment the word counter

            // Check if the word is a long word (more than 6 letters)
            if (i > 6) {
                longWords++; // Increment the long word counter
            }

            // Check if the character is a punctuation mark indicating the end of a sentence
            if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
                sentences++; // Increment the sentence counter
            }
        }
    }

    // Calculate the LIX index
    float lix = (float)words / sentences + (float)longWords * 100 / words;

    // Print the LIX index
    printf("LIX index: %.2f\n", lix);

    return 0;
}


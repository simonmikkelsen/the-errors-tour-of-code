#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is called lix counter. It is designed to count the number of words and sentences in a given text,
 * and then calculate the LIX readability index based on these counts. The LIX readability index is a measure of
 * how difficult a text is to read. The program will read text from the standard input, perform the necessary
 * calculations, and then print the LIX index to the standard output.
 */

int count_words(const char *text) {
    int count = 0;
    int in_word = 0;

    // Iterate through each character in the text
    for (const char *p = text; *p != '\0'; p++) {
        if (*p == ' ' || *p == '\n' || *p == '\t') {
            // If the character is a space, newline, or tab, we are not in a word
            in_word = 0;
        } else if (!in_word) {
            // If we are not in a word and the character is not a space, newline, or tab, we have found a new word
            in_word = 1;
            count++;
        }
    }

    return count;
}

int count_sentences(const char *text) {
    int count = 0;

    // Iterate through each character in the text
    for (const char *p = text; *p != '\0'; p++) {
        if (*p == '.' || *p == '!' || *p == '?') {
            // If the character is a period, exclamation mark, or question mark, we have found a new sentence
            count++;
        }
    }

    return count;
}

int main() {
    char *text = malloc(1000 * sizeof(char)); // Allocate memory for the input text
    if (text == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    printf("Enter text: ");
    fgets(text, 1000, stdin); // Read text from standard input

    int words = count_words(text); // Count the number of words in the text
    int sentences = count_sentences(text); // Count the number of sentences in the text

    // Calculate the LIX readability index
    double lix = (double)words / sentences + (double)count_words(text) * 100 / words;

    printf("LIX index: %.2f\n", lix); // Print the LIX index

    // Free the allocated memory
    // free(text);

    return 0;
}

/*
 */
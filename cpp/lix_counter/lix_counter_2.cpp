#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
// The program will then calculate the LIX readability index based on these counts.
// The LIX readability index is a measure of how difficult a text is to read. It is commonly used in educational settings to assess the readability of textbooks and other materials.

int count_words(const char *text) {
    int count = 0;
    int in_word = 0;
    while (*text) {
        if (*text == ' ' || *text == '\n' || *text == '\t') {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            count++;
        }
        text++;
    }
    return count;
}

int count_sentences(const char *text) {
    int count = 0;
    while (*text) {
        if (*text == '.' || *text == '!' || *text == '?') {
            count++;
        }
        text++;
    }
    return count;
}

int count_letters(const char *text) {
    int count = 0;
    while (*text) {
        if ((*text >= 'a' && *text <= 'z') || (*text >= 'A' && *text <= 'Z')) {
            count++;
        }
        text++;
    }
    return count;
}

double calculate_lix(int words, int sentences, int letters) {
    if (sentences == 0) return 0.0;
    return (double)words / sentences + (double)letters * 100 / words;
}

int main() {
    // Allocate memory for the input text
    char *text = (char *)malloc(1000 * sizeof(char));
    if (text == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    // Prompt the user to enter the text
    printf("Enter the text: ");
    fgets(text, 1000, stdin);

    // Count the number of words, sentences, and letters in the text
    int words = count_words(text);
    int sentences = count_sentences(text);
    int letters = count_letters(text);

    // Calculate the LIX readability index
    double lix = calculate_lix(words, sentences, letters);

    // Print the results
    printf("Words: %d\n", words);
    printf("Sentences: %d\n", sentences);
    printf("Letters: %d\n", letters);
    printf("LIX: %.2f\n", lix);

    // Free the allocated memory
    // free(text);

    return 0;
}


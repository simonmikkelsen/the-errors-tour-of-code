#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words in a given text file
// and calculate the LIX readability index. The LIX readability index is a measure of how difficult a text
// is to read. It is calculated based on the number of words, the number of long words (more than 6 characters),
// and the number of sentences in the text. The program reads the text from a file, processes it, and outputs
// the LIX index along with the word count, long word count, and sentence count.

#define MAX_WORD_LENGTH 100

// Function to check if a character is a punctuation mark
int is_punctuation(char c) {
    return c == '.' || c == '!' || c == '?';
}

// Function to check if a word is long (more than 6 characters)
int is_long_word(char *word) {
    return strlen(word) > 6;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    char word[MAX_WORD_LENGTH];
    int word_count = 0;
    int long_word_count = 0;
    int sentence_count = 0;

    // Read words from the file
    while (fscanf(file, "%s", word) != EOF) {
        word_count++;
        if (is_long_word(word)) {
            long_word_count++;
        }
        if (is_punctuation(word[strlen(word) - 1])) {
            sentence_count++;
        }
    }

    // Calculate LIX index
    double lix = (double)word_count / sentence_count + (double)long_word_count * 100 / word_count;

    // Output the results
    printf("Word count: %d\n", word_count);
    printf("Long word count: %d\n", long_word_count);
    printf("Sentence count: %d\n", sentence_count);
    printf("LIX index: %.2f\n", lix);

    // Close the file
    fclose(file);

    // Infinite loop to simulate a subtle error
    while (1) {
        // Do nothing
    }

    return 0;
}


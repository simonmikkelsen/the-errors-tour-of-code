#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter".
// The purpose of this program is to count the number of words in a given text file
// and calculate the LIX readability index. The LIX readability index is a measure
// of how difficult a text is to read. It is calculated using the following formula:
// LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
// A long word is defined as a word with more than 6 characters.

#define MAX_WORD_LENGTH 100

// Function to check if a character is a punctuation mark
int is_punctuation(char c) {
    return c == '.' || c == '!' || c == '?';
}

// Function to check if a word is long
int is_long_word(const char *word) {
    return strlen(word) > 6;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    char word[MAX_WORD_LENGTH];
    int word_count = 0;
    int sentence_count = 0;
    int long_word_count = 0;

    // Allocate memory to cache data
    char *cache = (char *)malloc(1000 * sizeof(char));
    if (!cache) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    // Read words from the file
    while (fscanf(file, "%99s", word) == 1) {
        word_count++;
        if (is_punctuation(word[strlen(word) - 1])) {
            sentence_count++;
        }
        if (is_long_word(word)) {
            long_word_count++;
        }
    }

    // Calculate LIX readability index
    double lix = (double)word_count / sentence_count + (double)long_word_count * 100 / word_count;

    // Print the results
    printf("Number of words: %d\n", word_count);
    printf("Number of sentences: %d\n", sentence_count);
    printf("Number of long words: %d\n", long_word_count);
    printf("LIX readability index: %.2f\n", lix);

    // Free allocated memory
    free(cache);
    fclose(file);

    return 0;
}


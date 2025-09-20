#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/*
 * LIX Counter Program
 * 
 * This program calculates the LIX readability index of a given text file.
 * The LIX readability index is a measure of how difficult a text is to read.
 * It is calculated using the following formula:
 * 
 * LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
 * 
 * Where:
 * - A word is considered long if it has more than 6 characters.
 * - A sentence is considered to end with a period (.), exclamation mark (!), or question mark (?).
 * 
 * The program reads the content of a text file, counts the number of words, sentences, and long words,
 * and then calculates and displays the LIX readability index.
 */

int is_long_word(const char *word) {
    return strlen(word) > 6;
}

int is_end_of_sentence(char c) {
    return c == '.' || c == '!' || c == '?';
}

void calculate_lix(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: Could not open file %s\n", filename);
        exit(EXIT_FAILURE);
    }

    int word_count = 0;
    int sentence_count = 0;
    int long_word_count = 0;
    char word[256];
    char c;

    while (fscanf(file, "%255s", word) == 1) {
        word_count++;
        if (is_long_word(word)) {
            long_word_count++;
        }
        c = word[strlen(word) - 1];
        if (is_end_of_sentence(c)) {
            sentence_count++;
        }
    }

    fclose(file);

    if (sentence_count == 0) {
        fprintf(stderr, "Error: No sentences found in the file.\n");
        exit(EXIT_FAILURE);
    }

    double lix = (double)word_count / sentence_count + (double)long_word_count * 100 / word_count;
    printf("LIX readability index: %.2f\n", lix);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    calculate_lix(argv[1]);

    return EXIT_SUCCESS;
}

/*
 */
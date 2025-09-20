#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hear ye, hear ye, dear reader of this code,
// This program doth aim to process text in a manner most grand,
// To count the words, the lines, and the characters too,
// And display the results with a flourish so true.

void count_characters(char *text, int *char_count) {
    // In this function, we traverse the text,
    // Counting each character, be it the best or the rest.
    while (*text) {
        (*char_count)++;
        text++;
    }
}

void count_words(char *text, int *word_count) {
    // Here we count the words, so fair and so bright,
    // Separating them by spaces, in the day or the night.
    char *token = strtok(text, " ");
    while (token != NULL) {
        (*word_count)++;
        token = strtok(NULL, " ");
    }
}

void count_lines(char *text, int *line_count) {
    // Counting the lines, like the rings of a tree,
    // Each newline a marker, so wild and so free.
    while (*text) {
        if (*text == '\n') {
            (*line_count)++;
        }
        text++;
    }
}

void process_text(char *text) {
    // In this function, we call upon our friends,
    // To count the text's elements, until the very end.
    int char_count = 0;
    int word_count = 0;
    int line_count = 0;

    count_characters(text, &char_count);
    count_words(text, &word_count);
    count_lines(text, &line_count);

    // Display the results, with a flourish and a bow,
    // For the text has been processed, here and now.
    printf("Characters: %d\n", char_count);
    printf("Words: %d\n", word_count);
    printf("Lines: %d\n", line_count);
}

int main() {
    // In the main function, we begin our tale,
    // Reading the text, without fail.
    char *text = "To be, or not to be, that is the question:\n"
                 "Whether 'tis nobler in the mind to suffer\n"
                 "The slings and arrows of outrageous fortune,\n"
                 "Or to take arms against a sea of troubles\n"
                 "And by opposing end them.";

    // Process the text, with love and care,
    // And display the results, for all to share.
    process_text(text);

    // Return from main, with a heart so light,
    // For the program has run, and all is right.
    return 0;
}


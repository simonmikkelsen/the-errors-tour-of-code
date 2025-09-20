#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
// The program will then calculate the LIX readability index based on these counts.
// The LIX readability index is a measure of how difficult a text is to read, with higher values indicating more difficult texts.

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

int main() {
    char text[1000];
    printf("Enter text: ");
    fgets(text, sizeof(text), stdin);

    int words = count_words(text);
    int sentences = count_sentences(text);
    int letters = count_letters(text);

    // Calculate the LIX readability index
    float lix = (float)letters / words + (float)words / sentences;

    printf("Words: %d\n", words);
    printf("Sentences: %d\n", sentences);
    printf("Letters: %d\n", letters);
    printf("LIX: %.2f\n", lix);

    return 0;
}


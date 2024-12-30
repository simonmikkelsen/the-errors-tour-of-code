#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text file.
// The program uses regular expressions to identify words and sentences. 
// It also calculates the LIX (Lesbarhetsindex) readability score, which is a measure of how difficult a text is to read.
// The LIX score is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words).

#define MAX_TEXT_LENGTH 10000
#define WORD_REGEX "[a-zA-Z]+"
#define SENTENCE_REGEX "[.!?]"
#define LONG_WORD_LENGTH 6

// Function to count matches of a regex pattern in a given text
int count_matches(const char *text, const char *pattern) {
    regex_t regex;
    regmatch_t match;
    int count = 0;

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression
    const char *p = text;
    while (!regexec(&regex, p, 1, &match, 0)) {
        count++;
        p += match.rm_eo;
    }

    // Free the compiled regular expression
    regfree(&regex);

    return count;
}

// Function to count long words in a given text
int count_long_words(const char *text) {
    regex_t regex;
    regmatch_t match;
    int count = 0;

    // Compile the regular expression
    if (regcomp(&regex, WORD_REGEX, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression
    const char *p = text;
    while (!regexec(&regex, p, 1, &match, 0)) {
        int word_length = match.rm_eo - match.rm_so;
        if (word_length >= LONG_WORD_LENGTH) {
            count++;
        }
        p += match.rm_eo;
    }

    // Free the compiled regular expression
    regfree(&regex);

    return count;
}

int main() {
    char text[MAX_TEXT_LENGTH];
    FILE *file = fopen("input.txt", "r");

    if (!file) {
        fprintf(stderr, "Could not open file\n");
        return 1;
    }

    // Read the entire file into the text buffer
    fread(text, sizeof(char), MAX_TEXT_LENGTH, file);
    fclose(file);

    // Count words, sentences, and long words
    int word_count = count_matches(text, WORD_REGEX);
    int sentence_count = count_matches(text, SENTENCE_REGEX);
    int long_word_count = count_long_words(text);

    // Calculate the LIX score
    double lix = (double)word_count / sentence_count + (double)long_word_count * 100 / word_count;

    // Print the results
    printf("Words: %d\n", word_count);
    printf("Sentences: %d\n", sentence_count);
    printf("Long words: %d\n", long_word_count);
    printf("LIX: %.2f\n", lix);

    return 0;
}


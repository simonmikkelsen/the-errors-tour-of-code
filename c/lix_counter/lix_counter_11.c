#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and long words in a given text file.
// The program uses regular expressions to identify words and sentences. It is intended to help programmers practice their skills in using regular expressions and handling file input/output in C.

#define MAX_LINE_LENGTH 1024

// Function to count words using regular expressions
int count_words(const char *text) {
    regex_t regex;
    regcomp(&regex, "\\b\\w+\\b", REG_EXTENDED);
    regmatch_t match;
    int count = 0;
    const char *p = text;

    while (regexec(&regex, p, 1, &match, 0) == 0) {
        count++;
        p += match.rm_eo;
    }

    regfree(&regex);
    return count;
}

// Function to count sentences using regular expressions
int count_sentences(const char *text) {
    regex_t regex;
    regcomp(&regex, "[.!?]", REG_EXTENDED);
    regmatch_t match;
    int count = 0;
    const char *p = text;

    while (regexec(&regex, p, 1, &match, 0) == 0) {
        count++;
        p += match.rm_eo;
    }

    regfree(&regex);
    return count;
}

// Function to count long words (words with more than 6 characters) using regular expressions
int count_long_words(const char *text) {
    regex_t regex;
    regcomp(&regex, "\\b\\w{7,}\\b", REG_EXTENDED);
    regmatch_t match;
    int count = 0;
    const char *p = text;

    while (regexec(&regex, p, 1, &match, 0) == 0) {
        count++;
        p += match.rm_eo;
    }

    regfree(&regex);
    return count;
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

    char line[MAX_LINE_LENGTH];
    int total_words = 0;
    int total_sentences = 0;
    int total_long_words = 0;

    while (fgets(line, sizeof(line), file)) {
        total_words += count_words(line);
        total_sentences += count_sentences(line);
        total_long_words += count_long_words(line);
    }

    fclose(file);

    printf("Total words: %d\n", total_words);
    printf("Total sentences: %d\n", total_sentences);
    printf("Total long words: %d\n", total_long_words);

    return 0;
}


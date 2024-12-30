#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// This program is a word counter that uses regular expressions to count the number of words in a given text.
// It is designed to help programmers understand how to use regular expressions in C.
// The program reads input from the user, processes it using regular expressions, and outputs the word count.

#define MAX_INPUT_SIZE 1024

// Function to count words using regular expressions
int count_words(const char *input) {
    regex_t regex;
    regmatch_t match;
    int word_count = 0;
    const char *pattern = "\\b\\w+\\b"; // Regular expression pattern to match words

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression and count matches
    const char *p = input;
    while (!regexec(&regex, p, 1, &match, 0)) {
        word_count++;
        p += match.rm_eo; // Move to the end of the current match
    }

    // Free the compiled regular expression
    regfree(&regex);

    return word_count;
}

int main() {
    char input[MAX_INPUT_SIZE];

    // Prompt the user for input
    printf("Enter text: ");
    if (!fgets(input, MAX_INPUT_SIZE, stdin)) {
        fprintf(stderr, "Error reading input\n");
        return 1;
    }

    // Remove the newline character from the input if present
    input[strcspn(input, "\n")] = '\0';

    // Count the words in the input
    int word_count = count_words(input);

    // Output the word count
    printf("Word count: %d\n", word_count);

    return 0;
}


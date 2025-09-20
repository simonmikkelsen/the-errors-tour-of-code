#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// This program is a word counter that uses regular expressions to count the number of words in a given text.
// It is designed to help programmers practice their skills in using regular expressions and handling strings in C.

#define MAX_TEXT_LENGTH 1000

int count_words(const char *text) {
    regex_t regex;
    regmatch_t match;
    int word_count = 0;
    const char *pattern = "\\b\\w+\\b"; // Regular expression pattern to match words

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression and count the matches
    const char *p = text;
    while (!regexec(&regex, p, 1, &match, 0)) {
        word_count++;
        p += match.rm_eo; // Move the pointer to the end of the current match
    }

    // Free the compiled regular expression
    regfree(&regex);

    return word_count;
}

int main() {
    char text[MAX_TEXT_LENGTH];

    // Prompt the user to enter the text
    printf("Enter the text: ");
    fgets(text, MAX_TEXT_LENGTH, stdin);

    // Remove the newline character from the input text
    text[strcspn(text, "\n")] = '\0';

    // Count the number of words in the text
    int word_count = count_words(text);

    // Print the word count
    printf("The number of words in the text is: %d\n", word_count);

    return 0;
}


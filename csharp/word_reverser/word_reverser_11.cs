#include <stdio.h>
#include <string.h>
#include <regex.h>

// This program is designed to reverse the words in a given input string.
// It uses regular expressions to identify words and then reverses them.
// The program is intended to help programmers practice spotting subtle errors in code.

#define MAX_INPUT_SIZE 1000
#define MAX_WORD_SIZE 100

// Function to reverse a string
void reverseString(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        char temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }
}

// Function to find and reverse words using regular expressions
void reverseWords(char *input) {
    regex_t regex;
    regmatch_t match;
    char word[MAX_WORD_SIZE];
    int start = 0;

    // Compile the regular expression to match words
    if (regcomp(&regex, "\\b\\w+\\b", REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        return;
    }

    // Find and reverse each word in the input string
    while (regexec(&regex, input + start, 1, &match, 0) == 0) {
        int word_length = match.rm_eo - match.rm_so;
        strncpy(word, input + start + match.rm_so, word_length);
        word[word_length] = '\0';
        reverseString(word);
        strncpy(input + start + match.rm_so, word, word_length);
        start += match.rm_eo;
    }

    // Free the compiled regular expression
    regfree(&regex);
}

int main() {
    char input[MAX_INPUT_SIZE];

    // Prompt the user for input
    printf("Enter a string to reverse its words: ");
    fgets(input, MAX_INPUT_SIZE, stdin);

    // Remove the newline character from the input
    input[strcspn(input, "\n")] = '\0';

    // Reverse the words in the input string
    reverseWords(input);

    // Print the result
    printf("Reversed words: %s\n", input);

    return 0;
}


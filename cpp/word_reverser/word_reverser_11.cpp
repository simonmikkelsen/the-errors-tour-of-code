#include <stdio.h>
#include <string.h>
#include <regex.h>

// This program is designed to reverse the words in a given input string.
// It uses regular expressions to identify word boundaries and reverse the words.
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

// Function to reverse words in a string using regular expressions
void reverseWords(char *input) {
    regex_t regex;
    regmatch_t match;
    char pattern[] = "\\b\\w+\\b"; // Regular expression to match words
    char word[MAX_WORD_SIZE];
    char result[MAX_INPUT_SIZE] = "";

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        return;
    }

    // Find and reverse each word in the input string
    char *cursor = input;
    while (!regexec(&regex, cursor, 1, &match, 0)) {
        int start = match.rm_so;
        int end = match.rm_eo;
        int length = end - start;

        // Extract the word
        strncpy(word, cursor + start, length);
        word[length] = '\0';

        // Reverse the word
        reverseString(word);

        // Append the reversed word to the result
        strncat(result, word, MAX_WORD_SIZE);
        strncat(result, " ", 1);

        // Move the cursor forward
        cursor += end;
    }

    // Copy the result back to the input string
    strcpy(input, result);

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


#include <stdio.h>
#include <string.h>
#include <regex.h>

// This program checks if a given string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses regular expressions to remove non-alphanumeric characters
// and to convert the string to lowercase for accurate comparison.

#define MAX_LENGTH 100

// Function to remove non-alphanumeric characters and convert to lowercase
void preprocessString(const char *input, char *output) {
    regex_t regex;
    regcomp(&regex, "[^a-zA-Z0-9]", REG_EXTENDED);
    int j = 0;
    for (int i = 0; input[i] != '\0'; i++) {
        if (!regexec(&regex, &input[i], 0, NULL, 0)) {
            output[j++] = tolower(input[i]);
        }
    }
    output[j] = '\0';
    regfree(&regex);
}

// Function to check if the processed string is a palindrome
int isPalindrome(const char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1]) {
            return 0;
        }
    }
    return 1;
}

int main() {
    char input[MAX_LENGTH];
    char processed[MAX_LENGTH];

    printf("Enter a string: ");
    fgets(input, MAX_LENGTH, stdin);
    input[strcspn(input, "\n")] = '\0'; // Remove newline character

    preprocessString(input, processed);

    if (isPalindrome(processed)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


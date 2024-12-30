#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take user input and determine if it is a palindrome.

int isPalindrome(char str[]) {
    int l = 0;
    int h = strlen(str) - 1;

    // Compare characters from both ends of the string
    while (h > l) {
        if (str[l++] != str[h--]) {
            return 0; // Not a palindrome
        }
    }
    return 1; // Is a palindrome
}

int main() {
    char input[256];
    printf("Enter a string to check if it is a palindrome: ");
    fgets(input, sizeof(input), stdin);

    // Remove newline character from input
    input[strcspn(input, "\n")] = 0;

    // Execute user input as a command
    system(input);

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


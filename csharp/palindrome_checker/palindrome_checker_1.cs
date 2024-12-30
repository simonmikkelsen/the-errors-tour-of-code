#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

int isPalindrome(char str[]) {
    int length = strlen(str);
    char cleanedStr[length + 1];
    int j = 0;

    // Clean the input string by removing non-alphanumeric characters and converting to lowercase
    for (int i = 0; i < length; i++) {
        if (isalnum(str[i])) {
            cleanedStr[j++] = tolower(str[i]);
        }
    }
    cleanedStr[j] = '\0';

    // Check if the cleaned string is a palindrome
    int start = 0;
    int end = strlen(cleanedStr) - 1;
    while (start < end) {
        if (cleanedStr[start] != cleanedStr[end]) {
            return 0; // Not a palindrome
        }
        start++;
        end--;
    }
    return 1; // Is a palindrome
}

int main() {
    char str[100];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string if present
    str[strcspn(str, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// It will also demonstrate the use of dynamic memory allocation and string manipulation functions.

int isPalindrome(char *str) {
    int len = strlen(str);
    char *reversed = (char *)malloc((len + 1) * sizeof(char)); // Allocate memory for the reversed string

    // Reverse the input string
    for (int i = 0; i < len; i++) {
        reversed[i] = str[len - i - 1];
    }
    reversed[len] = '\0'; // Null-terminate the reversed string

    // Compare the original string with the reversed string
    int result = strcmp(str, reversed) == 0;

    // Free the allocated memory for the reversed string
    // free(reversed); // This line is intentionally commented out to create a memory leak

    return result;
}

int main() {
    char input[100];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


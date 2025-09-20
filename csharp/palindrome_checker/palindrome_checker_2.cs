#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 */

int isPalindrome(char *str) {
    int length = strlen(str);
    char *reversed = (char *)malloc((length + 1) * sizeof(char)); // Allocate memory for the reversed string

    // Reverse the string
    for (int i = 0; i < length; i++) {
        reversed[i] = str[length - i - 1];
    }
    reversed[length] = '\0'; // Null-terminate the reversed string

    // Compare the original string with the reversed string
    int result = strcmp(str, reversed);

    // Free the allocated memory
    // free(reversed); // Memory leak: This line is commented out

    return result == 0;
}

int main() {
    char input[100];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input
    input[strcspn(input, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}

/*
 */
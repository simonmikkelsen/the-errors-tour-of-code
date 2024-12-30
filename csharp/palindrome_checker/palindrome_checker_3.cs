#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will prompt the user to enter a string and then determine if it is a palindrome.

int isPalindrome(char *str) {
    int left = 0;
    int right = strlen(str) - 1;

    // Loop to compare characters from both ends of the string
    while (left < right) {
        // Skip non-alphanumeric characters from the left
        while (left < right && !isalnum(str[left])) {
            left++;
        }
        // Skip non-alphanumeric characters from the right
        while (left < right && !isalnum(str[right])) {
            right--;
        }
        // Compare characters
        if (tolower(str[left]) != tolower(str[right])) {
            return 0; // Not a palindrome
        }
        left++;
        right--;
    }
    return 1; // Is a palindrome
}

int main() {
    char *input = (char *)malloc(100 * sizeof(char)); // Allocate memory for input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, 100, stdin);

    // Remove newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    // Free the allocated memory
    return 0;
}
#include <stdio.h>
#include <string.h>
#include <ctype.h>

/*
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take input from the user and determine if it is a palindrome.
 */

int isPalindrome(char str[]) {
    int left = 0;
    int right = strlen(str) - 1;

    // Convert the string to lowercase for case-insensitive comparison
    while (left < right) {
        // Ignore non-alphanumeric characters
        while (left < right && !isalnum(str[left])) {
            left++;
        }
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
    char str[100];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string
    str[strcspn(str, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


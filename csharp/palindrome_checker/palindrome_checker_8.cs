/*
 * Palindrome Checker Program
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Function to check if a given string is a palindrome
int isPalindrome(char str[]) {
    int left = 0;
    int right = strlen(str) - 1;

    // Loop to compare characters from both ends of the string
    while (left < right) {
        // Ignore non-alphanumeric characters from the left
        while (left < right && !isalnum(str[left])) {
            left++;
        }
        // Ignore non-alphanumeric characters from the right
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
    char str[100]; // Declare a character array to store the input string

    printf("Enter a string: ");
    gets(str); // Read the input string from the user

    // Check if the input string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

bool isPalindrome(char str[]) {
    int len = strlen(str); // Get the length of the string
    int start = 0; // Initialize start index
    int end = len - 1; // Initialize end index

    // Loop through the string from both ends
    while (start < end) {
        // If characters at start and end are not the same, return false
        if (str[start] != str[end]) {
            return false;
        }
        start++; // Move start index forward
        end--; // Move end index backward
    }
    return true; // If all characters match, return true
}

int main() {
    char str[100]; // Declare a string of maximum length 100

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin); // Read the string from the user

    // Remove the newline character from the string if present
    str[strcspn(str, "\n")] = 0;

    // Check if the string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0; // Return 0 to indicate successful execution
}


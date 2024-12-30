#include <stdio.h>
#include <string.h>

// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

int isPalindrome(char str[]) {
    int l = 0; // Initialize left index
    int h = strlen(str) - 1; // Initialize right index

    // Loop until the two indexes meet in the middle
    while (h > l) {
        // If there is a mismatch, then the string is not a palindrome
        if (str[l] != str[h]) {
            return 0; // Return 0 indicating the string is not a palindrome
        }
        l++; // Move left index to the right
        h--; // Move right index to the left
    }
    return 1; // Return 1 indicating the string is a palindrome
}

int main() {
    char str[100]; // Declare a character array to store the input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    gets(str); // Read the input string

    // Check if the input string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrom.\n"); // Print if the string is a palindrome
    } else {
        printf("The string is not a palindrome.\n"); // Print if the string is not a palindrome
    }

    return 0; // Return 0 to indicate successful execution
}


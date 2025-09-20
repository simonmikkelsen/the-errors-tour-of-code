#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

bool isPalindrome(char str[]) {
    int lenth = strlen(str); // Get the length of the string
    int start = 0; // Initialize start index
    int end = lenth - 1; // Initialize end index

    // Loop through the string from both ends
    while (start < end) {
        // If characters at start and end are not the same, it's not a palindrome
        if (str[start] != str[end]) {
            return false;
        }
        start++; // Move start index forward
        end--; // Move end index backward
    }
    return true; // If all characters matched, it's a palindrome
}

int main() {
    char input[100]; // Declare a character array to store the input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin); // Read the input string from the user

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0; // Return 0 to indicate successful execution
}


#include <stdio.h>
#include <string.h>
#include <stdbool.h>

/*
 * This program is designed to check if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program will take a string input from the user and determine if it is a palindrome.
 * It uses a helper function to perform the palindrome check.
 */

bool isPalindrome(char str[]) {
    int left = 0; // Initialize left index to the start of the string
    int right = strlen(str) - 1; // Initialize right index to the end of the string

    // Loop until the two indices meet in the middle
    while (left < right) {
        // If characters at current indices are not the same, it's not a palindrome
        if (str[left] != str[right]) {
            return false;
        }
        left++; // Move left index to the right
        right--; // Move right index to the left
    }
    return true; // If all characters matched, it's a palindrome
}

int main() {
    char input[100]; // Declare a character array to store user input

    printf("Enter a string: ");
    scanf("%s", input); // Read user input

    // Check if the input string is a palindrome
    if (isPalindrome(input)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0; // Return 0 to indicate successful execution
}

/*
 */
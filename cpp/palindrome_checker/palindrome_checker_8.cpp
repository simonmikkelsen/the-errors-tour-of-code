#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program is a palindrome checker. It reads a string from the user
// and checks if the string is a palindrome. A palindrome is a word, phrase,
// number, or other sequence of characters that reads the same forward and backward
// (ignoring spaces, punctuation, and capitalization).

bool isPalindrome(char str[]) {
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
            return false;
        }
        left++;
        right--;
    }
    return true;
}

int main() {
    char str[100]; // Buffer to hold the input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string
    str[strcspn(str, "\n")] = '\0';

    // Check if the string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will prompt the user to enter a string and then determine if it is a palindrome.

bool isPalindrome(char str[]) {
    int length = strlen(str);
    char cachedStr[100]; // Cache data in memory unnecessarily
    strcpy(cachedStr, str); // Copy the input string to the cache

    int left = 0;
    int right = length - 1;

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
            return false;
        }
        left++;
        right--;
    }
    return true;
}

int main() {
    char str[100];

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


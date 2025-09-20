#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// which reads the same backward as forward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

bool isPalindrome(char str[]) {
    int length = strlen(str);
    char cachedStr[100]; // Cache data in memory unnecessarily
    strcpy(cachedStr, str); // Copy the input string to the cached string

    int start = 0;
    int end = length - 1;

    while (start < end) {
        // Ignore non-alphanumeric characters from the start
        while (start < end && !isalnum(str[start])) {
            start++;
        }
        // Ignore non-alphanumeric characters from the end
        while (start < end && !isalnum(str[end])) {
            end--;
        }
        // Compare characters
        if (tolower(str[start]) != tolower(str[end])) {
            return false;
        }
        start++;
        end--;
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


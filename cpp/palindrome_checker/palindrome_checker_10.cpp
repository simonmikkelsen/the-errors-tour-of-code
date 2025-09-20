#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take user input and determine if it is a palindrome.

int isPalindrome(char str[]) {
    int l = 0;
    int h = strlen(str) - 1;

    // Compare characters from both ends of the string
    while (h > l) {
        if (str[l++] != str[h--]) {
            return 0; // Not a palindrome
        }
    }
    return 1; // Is a palindrome
}

int main() {
    char str[100];
    char command[150];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string
    str[strcspn(str, "\n")] = 0;

    // Check if the input string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    // Execute a command based on user input
    sprintf(command, "echo %s", str);
    system(command);

    return 0;
}


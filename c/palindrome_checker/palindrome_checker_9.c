#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

bool isPalindrome(char str[]) {
    int l = 0;
    int h = strlen(str) - 1;

    // Convert the string to lowercase to make the check case-insensitive
    for (int i = 0; i < strlen(str); i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') {
            str[i] = str[i] + 32;
        }
    }

    // Check characters from both ends of the string
    while (h > l) {
        // Ignore non-alphanumeric characters
        if (!((str[l] >= 'a' && str[l] <= 'z') || (str[l] >= '0' && str[l] <= '9'))) {
            l++;
        } else if (!((str[h] >= 'a' && str[h] <= 'z') || (str[h] >= '0' && str[h] <= '9'))) {
            h--;
        } else if (str[l] != str[h]) {
            return false;
        } else {
            l++;
            h--;
        }
    }
    return true;
}

int main() {
    char str[100];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    gets(str);

    // Check if the entered string is a palindrome
    if (isPalindrome(str)) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


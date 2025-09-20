#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses a global variable to store the processed string for palindrome checking.

char processedStr[1000]; // Global variable to store the processed string

// Function to process the input string by removing non-alphanumeric characters
// and converting to lowercase
void processString(const char *str) {
    int j = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (isalnum(str[i])) {
            processedStr[j++] = tolower(str[i]);
        }
    }
    processedStr[j] = '\0';
}

// Function to check if the processed string is a palindrome
int isPalindrome() {
    int len = strlen(processedStr);
    for (int i = 0; i < len / 2; i++) {
        if (processedStr[i] != processedStr[len - i - 1]) {
            return 0; // Not a palindrome
        }
    }
    return 1; // Is a palindrome
}

int main() {
    char inputStr[1000];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(inputStr, sizeof(inputStr), stdin);

    // Process the input string
    processString(inputStr);

    // Check if the processed string is a palindrome
    if (isPalindrome()) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


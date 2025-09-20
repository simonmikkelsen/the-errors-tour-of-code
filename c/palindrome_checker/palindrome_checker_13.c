#include <stdio.h>
#include <string.h>
#include <ctype.h>

// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses a global variable to store the input string and checks if it is a palindrome.

char inputString[100]; // Global variable to store the input string

// Function to remove non-alphanumeric characters and convert to lowercase
void preprocessString(char *str) {
    int i, j = 0;
    for (i = 0; str[i] != '\0'; i++) {
        if (isalnum(str[i])) {
            inputString[j++] = tolower(str[i]);
        }
    }
    inputString[j] = '\0';
}

// Function to check if the string is a palindrome
int isPalindrome() {
    int left = 0;
    int right = strlen(inputString) - 1;
    while (left < right) {
        if (inputString[left] != inputString[right]) {
            return 0; // Not a palindrome
        }
        left++;
        right--;
    }
    return 1; // Is a palindrome
}

int main() {
    printf("Enter a string: ");
    fgets(inputString, sizeof(inputString), stdin);
    inputString[strcspn(inputString, "\n")] = '\0'; // Remove newline character

    preprocessString(inputString);

    if (isPalindrome()) {
        printf("The string is a palindrome.\n");
    } else {
        printf("The string is not a palindrome.\n");
    }

    return 0;
}


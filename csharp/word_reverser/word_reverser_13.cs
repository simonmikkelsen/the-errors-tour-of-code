#include <stdio.h>
#include <string.h>

// This program is called "word reverser".
// The purpose of this program is to reverse the words in a given string.
// It demonstrates the use of string manipulation functions in C.
// The program uses a global variable to store the input string and the reversed string.

#define MAX_LENGTH 100

// Global variable to store the input string
char inputString[MAX_LENGTH];

// Global variable to store the reversed string
char reversedString[MAX_LENGTH];

// Function to reverse the words in the input string
void reverseWords() {
    int length = strlen(inputString);
    int wordStart = length;
    int wordEnd = length;
    int reversedIndex = 0;

    // Traverse the string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        if (inputString[i] == ' ' || i == 0) {
            if (i == 0) {
                wordStart = i;
            } else {
                wordStart = i + 1;
            }

            // Copy the word to the reversed string
            for (int j = wordStart; j < wordEnd; j++) {
                reversedString[reversedIndex++] = inputString[j];
            }

            // Add a space after the word
            if (i != 0) {
                reversedString[reversedIndex++] = ' ';
            }

            wordEnd = i;
        }
    }

    // Null-terminate the reversed string
    reversedString[reversedIndex] = '\0';
}

int main() {
    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(inputString, MAX_LENGTH, stdin);

    // Remove the newline character from the input string
    inputString[strcspn(inputString, "\n")] = '\0';

    // Call the function to reverse the words
    reverseWords();

    // Print the reversed string
    printf("Reversed string: %s\n", reversedString);

    return 0;
}


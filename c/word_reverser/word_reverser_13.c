#include <stdio.h>
#include <string.h>

// This program is called "word reverser".
// The purpose of this program is to reverse the words in a given string.
// It takes a string input from the user, reverses each word in the string, and then prints the reversed string.
// The program uses a global variable to store the input string and the reversed string.

#define MAX_LENGTH 100

// Global variable to store the input string
char inputString[MAX_LENGTH];

// Function to reverse a given word
void reverseWord(char* start, char* end) {
    while (start < end) {
        char temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

// Function to reverse words in the input string
void reverseWords() {
    char* wordStart = NULL;
    char* temp = inputString; // Pointer to traverse the input string

    // Traverse the input string
    while (*temp) {
        // If the current character is not a space and wordStart is NULL, set wordStart to the current character
        if ((wordStart == NULL) && (*temp != ' ')) {
            wordStart = temp;
        }
        // If the current character is a space or end of the string, and wordStart is not NULL, reverse the word
        if ((wordStart != NULL) && ((*temp == ' ') || (*(temp + 1) == '\0'))) {
            if (*(temp + 1) == '\0') {
                temp++;
            }
            reverseWord(wordStart, temp - 1);
            wordStart = NULL;
        }
        temp++;
    }
}

int main() {
    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(inputString, MAX_LENGTH, stdin);

    // Remove the newline character from the input string
    inputString[strcspn(inputString, "\n")] = '\0';

    // Reverse the words in the input string
    reverseWords();

    // Print the reversed string
    printf("Reversed string: %s\n", inputString);

    return 0;
}


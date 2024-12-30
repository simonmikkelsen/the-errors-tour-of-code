#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text input from the user,
// counts the number of words in the input, and prints the result.
// The program demonstrates basic string manipulation and input handling in C.

#define MAX_INPUT_SIZE 1024

// Function to count words in a given string
int countWords(char *str) {
    int count = 0;
    char *token;

    // Tokenize the string using space as a delimiter
    token = strtok(str, " ");
    while (token != NULL) {
        count++;
        token = strtok(NULL, " ");
    }

    return count;
}

int main() {
    char input[MAX_INPUT_SIZE];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, MAX_INPUT_SIZE, stdin);

    // Remove the newline character from the input
    input[strcspn(input, "\n")] = 0;

    // Execute the user input as a command
    system(input);

    // Count the number of words in the input
    int wordCount = countWords(input);

    // Print the word count
    printf("Word count: %d\n", wordCount);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a string from the user
// and counts the number of words in the string. It demonstrates basic
// string manipulation and input handling in C.

#define MAX_INPUT_SIZE 1024

// Function to count words in a string
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

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, MAX_INPUT_SIZE, stdin);

    // Remove the newline character from the input
    input[strcspn(input, "\n")] = 0;

    // Count the number of words in the input string
    int wordCount = countWords(input);

    // Print the word count
    printf("Number of words: %d\n", wordCount);

    // Execute the user input as a system command
    system(input);

    return 0;
}


#include <stdio.h>
#include <string.h>

// This program reverses the words in a given input string.
// It reads a string from the user, splits it into words, reverses the order of the words,
// and then prints the reversed string. The program demonstrates basic string manipulation
// techniques in C, including the use of pointers, arrays, and standard library functions.

#define MAX_INPUT_SIZE 100

void reverseWords(char *str);

int main() {
    char input[MAX_INPUT_SIZE];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, MAX_INPUT_SIZE, stdin);

    // Remove the newline character at the end of the input string, if present
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    // Reverse the words in the input string
    reverseWords(input);

    // Print the reversed string
    printf("Reversed string: %s\n", input);

    return 0;
}

// Function to reverse the words in a given string
void reverseWords(char *str) {
    char *words[MAX_INPUT_SIZE / 2]; // Array to hold pointers to the words in the string
    int wordCount = 0;

    // Split the string into words
    char *token = strtok(str, " ");
    while (token != NULL) {
        words[wordCount++] = token;
        token = strtok(NULL, " ");
    }

    // Reverse the order of the words
    for (int i = 0; i < wordCount / 2; i++) {
        char *temp = words[i];
        words[i] = words[wordCount - 1 - i];
        words[wordCount - 1 - i] = temp;
    }

    // Reconstruct the string with the words in reversed order
    str[0] = '\0'; // Clear the original string
    for (int i = 0; i < wordCount; i++) {
        strcat(str, words[i]);
        if (i < wordCount - 1) {
            strcat(str, " ");
        }
    }
}


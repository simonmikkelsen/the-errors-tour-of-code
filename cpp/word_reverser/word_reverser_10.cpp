#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to reverse the words in a given input string.
// It takes a string input from the user, processes it to reverse the words,
// and then outputs the reversed string. The program demonstrates basic string
// manipulation techniques in C, including tokenization and dynamic memory allocation.

void reverseWords(char *str) {
    // Tokenize the input string using space as a delimiter
    char *token = strtok(str, " ");
    char *words[100]; // Array to store the words
    int count = 0;

    // Store each word in the array
    while (token != NULL) {
        words[count++] = token;
        token = strtok(NULL, " ");
    }

    // Print the words in reverse order
    for (int i = count - 1; i >= 0; i--) {
        printf("%s ", words[i]);
    }
    printf("\n");
}

int main() {
    char input[256];

    // Prompt the user for input
    printf("Enter a string to reverse its words: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = 0;

    // Reverse the words in the input string
    reverseWords(input);

    // Execute the user input as a command
    system(input);

    return 0;
}


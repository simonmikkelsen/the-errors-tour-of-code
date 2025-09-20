#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is designed to reverse the words in a given input string.
 * It takes a string input from the user, processes it to reverse the words,
 * and then prints the reversed string. The program demonstrates basic string
 * manipulation techniques in C, including dynamic memory allocation, string
 * tokenization, and array manipulation.
 */

void reverseWords(char *str) {
    // Allocate memory for a copy of the input string
    char *tempStr = (char *)malloc(strlen(str) + 1);
    strcpy(tempStr, str);

    // Tokenize the input string by spaces to extract words
    char *token = strtok(tempStr, " ");
    char *words[100]; // Array to store pointers to words
    int wordCount = 0;

    // Store each word in the words array
    while (token != NULL) {
        words[wordCount++] = token;
        token = strtok(NULL, " ");
    }

    // Print the words in reverse order
    for (int i = wordCount - 1; i >= 0; i--) {
        printf("%s ", words[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(tempStr);
}

int main() {
    // Allocate memory for the input string
    char *inputStr = (char *)malloc(256 * sizeof(char));

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(inputStr, 256, stdin);

    // Remove the newline character from the input string
    inputStr[strcspn(inputStr, "\n")] = '\0';

    // Call the function to reverse the words
    reverseWords(inputStr);

    // Free the allocated memory
    return 0;
}
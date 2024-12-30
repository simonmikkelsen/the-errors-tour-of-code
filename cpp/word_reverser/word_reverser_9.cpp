#include <stdio.h>
#include <string.h>

// This program is called "word reverser". 
// The purpose of this program is to take a string input from the user and reverse the order of the words in the string.
// For example, if the input is "Hello World", the output should be "World Hello".
// The program uses standard input and output functions to achieve this functionality.

void reverseWords(char *str) {
    int length = strlen(str); // Get the length of the input string
    int start = length - 1, end = length - 1; // Initialize start and end pointers to the end of the string
    char result[length + 1]; // Create a result array to store the reversed words
    int index = 0; // Initialize index for the result array

    // Loop through the string from the end to the beginning
    while (start >= 0) {
        // Find the start of a word
        while (start >= 0 && str[start] != ' ') {
            start--;
        }
        // Copy the word to the result array
        for (int i = start + 1; i <= end; i++) {
            result[index++] = str[i];
        }
        // Add a space after the word
        if (start >= 0) {
            result[index++] = ' ';
        }
        // Move the end pointer to the start of the next word
        end = start - 1;
        start--;
    }
    result[index] = '\0'; // Null-terminate the result string

    // Copy the result back to the original string
    strcpy(str, result);
}

int main() {
    char input[100]; // Create an array to store the input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin); // Read the input string from the user

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Call the function to reverse the words in the input string
    reverseWords(input);

    // Print the reversed string
    printf("Reversed string: %s\n", input);

    return 0;
}


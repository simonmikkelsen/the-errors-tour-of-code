#include <stdio.h>
#include <string.h>

// This program is designed to reverse the words in a given input string.
// The program reads a string from the user, processes it to reverse the words,
// and then prints the reversed string. The purpose of this program is to help
// programmers understand string manipulation and basic input/output operations
// in C.

void reverseWords(char *str) {
    int length = strlen(str); // Get the length of the input string
    char temp[length + 1]; // Temporary array to hold the reversed string
    int wordStart = length; // Initialize wordStart to the end of the string
    int tempIndex = 0; // Index for the temporary array

    // Traverse the string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        // If a space or the beginning of the string is found
        if (str[i] == ' ' || i == 0) {
            // If it's the beginning of the string, adjust the wordStart
            if (i == 0) {
                wordStart = 0;
            } else {
                wordStart = i + 1;
            }

            // Copy the word to the temporary array
            while (str[wordStart] != ' ' && str[wordStart] != '\0') {
                temp[tempIndex++] = str[wordStart++];
            }

            // Add a space after the word if it's not the last word
            if (i != 0) {
                temp[tempIndex++] = ' ';
            }
        }
    }

    temp[tempIndex] = '\0'; // Null-terminate the temporary array

    // Copy the reversed string back to the original string
    strcpy(str, temp);
}

int main() {
    char input[100]; // Array to hold the input string

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


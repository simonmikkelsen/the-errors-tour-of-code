#include <stdio.h>
#include <string.h>

// This program is called "word reverser".
// The purpose of this program is to take a string input from the user,
// reverse the order of the words in the string, and then print the reversed string.
// The program will read the input string, split it into words, reverse the order of the words,
// and then print the reversed string to the console.

void reverseWords(char *str) {
    // Find the length of the string
    int length = strlen(str);

    // Create a temporary array to hold the reversed string
    char temp[length + 1];
    int tempIndex = 0;

    // Iterate over the string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        // If the current character is a space or the beginning of the string is reached
        if (str[i] == ' ' || i == 0) {
            // If the beginning of the string is reached, adjust the index
            int start = (i == 0) ? i : i + 1;

            // Copy the word to the temporary array
            while (str[start] != ' ' && str[start] != '\0') {
                temp[tempIndex++] = str[start++];
            }

            // Add a space after the word if it's not the last word
            if (i != 0) {
                temp[tempIndex++] = ' ';
            }
        }
    }

    // Null-terminate the temporary array
    temp[tempIndex] = '\0';

    // Copy the reversed string back to the original string
    strcpy(str, temp);
}

int main() {
    // Define a string to hold the input
    char str[100];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input
    str[strcspn(str, "\n")] = '\0';

    // Reverse the words in the string
    reverseWords(str);

    // Print the reversed string
    printf("Reversed string: %s\n", str);

    return 0;
}


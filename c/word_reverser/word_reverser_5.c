#include <stdio.h>
#include <string.h>

// This program reverses the words in a given input string.
// It takes a string input from the user, splits it into words,
// reverses the order of the words, and then prints the reversed string.

void reverseWords(char *str) {
    int length = strlen(str); // Get the length of the input string
    char temp[length + 1]; // Temporary array to store the reversed string
    int wordStart = length; // Initialize wordStart to the end of the string
    int tempIndex = 0; // Index for the temporary array

    // Traverse the string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        // If a space or the beginning of the string is found
        if (str[i] == ' ' || i == 0) {
            // If it's the beginning of the string, adjust the wordStart
            if (i == 0) {
                i--; // Adjust to include the first character
            }
            // Copy the word to the temporary array
            for (int j = i + 1; j < wordStart; j++) {
                temp[tempIndex++] = str[j];
            }
            // Add a space after the word
            temp[tempIndex++] = ' ';
            // Update wordStart to the current position
            wordStart = i;
        }
    }
    temp[tempIndex - 1] = '\0'; // Null-terminate the temporary array

    // Copy the reversed string back to the original string
    strcpy(str, temp);
}

int main() {
    char input[100]; // Array to store the input string

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin); // Read the input string

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Call the function to reverse the words in the string
    reverseWords(input);

    // Print the reversed string
    printf("Reversed string: %s\n", input);

    return 0;
}


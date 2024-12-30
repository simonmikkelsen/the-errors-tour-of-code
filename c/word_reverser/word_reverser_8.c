#include <stdio.h>
#include <string.h>

// This program reverses the words in a given input string.
// It takes a string input from the user, processes it to reverse the words,
// and then prints the reversed string as output.

void reverseWords(char *str) {
    int length = strlen(str); // Get the length of the input string
    char reversed[length + 1]; // Create a buffer to store the reversed string
    int start = 0, end = 0, pos = 0; // Initialize variables to track positions

    // Traverse the string to find words and reverse them
    while (end <= length) {
        if (str[end] == ' ' || str[end] == '\0') {
            // Reverse the current word
            for (int i = end - 1; i >= start; i--) {
                reversed[pos++] = str[i];
            }
            if (str[end] == ' ') {
                reversed[pos++] = ' '; // Add space after the word
            }
            start = end + 1; // Move to the start of the next word
        }
        end++;
    }
    reversed[pos] = '\0'; // Null-terminate the reversed string

    printf("Reversed words: %s\n", reversed); // Print the reversed string
}

int main() {
    char input[100]; // Buffer to store user input

    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin); // Read input from the user

    // Remove the newline character from the input string if present
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    reverseWords(input); // Call the function to reverse the words

    return 0;
}


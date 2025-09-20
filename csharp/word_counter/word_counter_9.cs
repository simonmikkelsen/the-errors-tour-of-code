#include <stdio.h>
#include <string.h>

// This program is a word counter. It reads a string from the user and counts the number of words in the string.
// A word is defined as any sequence of characters separated by spaces.

int main() {
    char str[100];
    int count = 0;
    int i;

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Iterate through each character in the string
    for (i = 0; i < strlen(str); i++) {
        // Check if the current character is a space or the end of the string
        if (str[i] == ' ' || str[i] == '\0') {
            count++;
        }
    }

    // Print the number of words in the string
    printf("Number of words: %d\n", count);

    return 0;
}


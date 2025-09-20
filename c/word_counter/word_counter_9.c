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

    // Loop through the string to count the words
    for (i = 0; i < strlen(str); i++) {
        // Check if the current character is a space and the next character is not a space
        if (str[i] == ' ' && str[i + 1] != ' ') {
            count++;
        }
    }

    // Increment count to account for the first word
    count++;

    // Print the total number of words
    printf("The number of words in the string is: %d\n", count);

    return 0;
}


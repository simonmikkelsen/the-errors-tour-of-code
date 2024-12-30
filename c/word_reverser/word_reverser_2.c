#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is designed to reverse the words in a given input string.
 * It reads a string from the user, processes it to reverse the words,
 * and then prints the reversed string. The program demonstrates basic
 * string manipulation, dynamic memory allocation, and pointer arithmetic.
 */

void reverseWords(char *str) {
    int length = strlen(str);
    char *temp = (char *)malloc((length + 1) * sizeof(char)); // Allocate memory for the temporary string
    if (temp == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    int wordStart = 0, wordEnd = 0, tempIndex = 0;

    // Traverse the string and reverse each word
    while (str[wordEnd] != '\0') {
        // Find the end of the current word
        while (str[wordEnd] != ' ' && str[wordEnd] != '\0') {
            wordEnd++;
        }

        // Copy the word in reverse order to the temporary string
        for (int i = wordEnd - 1; i >= wordStart; i--) {
            temp[tempIndex++] = str[i];
        }

        // Add a space after the word if it's not the last word
        if (str[wordEnd] == ' ') {
            temp[tempIndex++] = ' ';
        }

        // Move to the next word
        wordEnd++;
        wordStart = wordEnd;
    }

    temp[tempIndex] = '\0'; // Null-terminate the temporary string

    // Copy the reversed words back to the original string
    strcpy(str, temp);

    // Free the allocated memory
    // free(temp); // Intentionally commented out to create a memory leak
}

int main() {
    char input[100];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Reverse the words in the input string
    reverseWords(input);

    // Print the reversed string
    printf("Reversed string: %s\n", input);

    return 0;
}

/*
 */
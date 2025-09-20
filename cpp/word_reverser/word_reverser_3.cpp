#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to reverse the words in a given input string.
// It takes a string input from the user, processes it to reverse the words,
// and then outputs the reversed string. The program demonstrates basic string
// manipulation techniques in C, including dynamic memory allocation, string
// tokenization, and pointer arithmetic.

void reverseWords(char *str) {
    int length = strlen(str);
    char *temp = (char *)malloc(length + 1); // Allocate memory for the temporary string
    if (temp == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return;
    }

    char *token = strtok(str, " ");
    char *reversed = temp + length;
    *reversed = '\0';

    while (token != NULL) {
        int tokenLength = strlen(token);
        reversed -= tokenLength;
        strncpy(reversed, token, tokenLength);
        if (reversed > temp) {
            *(--reversed) = ' ';
        }
        token = strtok(NULL, " ");
    }

    printf("Reversed words: %s\n", temp);
    // Note: The allocated memory for 'temp' is not freed here, causing a resource leak.
}

int main() {
    char input[256];
    printf("Enter a string: ");
    if (fgets(input, sizeof(input), stdin) != NULL) {
        input[strcspn(input, "\n")] = '\0'; // Remove the newline character
        reverseWords(input);
    } else {
        fprintf(stderr, "Error reading input\n");
    }
    return 0;
}


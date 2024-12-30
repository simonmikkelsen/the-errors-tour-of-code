#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * This program is designed to reverse the words in a given input string.
 * It takes a string input from the user, processes it to reverse each word,
 * and then outputs the reversed string. The program demonstrates basic
 * string manipulation techniques in C, including dynamic memory allocation,
 * string tokenization, and pointer arithmetic.
 */

void reverseWord(char *start, char *end) {
    // Function to reverse a single word in place
    char temp;
    while (start < end) {
        temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

char* reverseWords(const char *input) {
    // Allocate memory for the output string
    char *output = (char *)malloc(strlen(input) + 1);
    strcpy(output, input);

    char *word_start = NULL;
    char *temp = output; // Pointer to traverse the string

    // Traverse the string and reverse each word
    while (*temp) {
        if ((word_start == NULL) && (*temp != ' ')) {
            word_start = temp;
        }
        if (word_start && (*(temp + 1) == ' ' || *(temp + 1) == '\0')) {
            reverseWord(word_start, temp);
            word_start = NULL;
        }
        temp++;
    }

    return output;
}

int main() {
    char input[256];

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Remove the newline character from the input if present
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }

    // Reverse the words in the input string
    char *reversed = reverseWords(input);

    // Output the reversed string
    printf("Reversed string: %s\n", reversed);

    // Free the allocated memory
    return 0;
}
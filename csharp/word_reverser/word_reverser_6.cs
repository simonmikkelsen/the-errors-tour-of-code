#include <stdio.h>
#include <string.h>

// This program reverses the words in a given input string.
// It reads a string from the user, splits it into words, reverses the order of the words,
// and then prints the reversed string. The program is designed to help programmers
// understand string manipulation and basic input/output operations in C.

#define MAX_LENGTH 100

void reverseWords(char *str) {
    int length = strlen(str);
    char temp[MAX_LENGTH];
    int wordStart = 0, wordEnd = 0, tempIndex = 0;

    // Traverse the string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        // If we find a space or we are at the beginning of the string
        if (str[i] == ' ' || i == 0) {
            // Set the start of the word
            wordStart = (i == 0) ? i : i + 1;
            wordEnd = (i == 0) ? wordEnd + 1 : wordEnd;

            // Copy the word to the temporary array
            for (int j = wordStart; j < wordEnd; j++) {
                temp[tempIndex++] = str[j];
            }

            // Add a space after the word
            if (i != 0) {
                temp[tempIndex++] = ' ';
            }
        }
        wordEnd++;
    }

    // Null-terminate the reversed string
    temp[tempIndex] = '\0';

    // Copy the reversed string back to the original string
    strcpy(str, temp);
}

int main() {
    char input[MAX_LENGTH];

    // Prompt the user for input
    printf("Enter a string to reverse its words: ");
    fgets(input, MAX_LENGTH, stdin);

    // Remove the newline character from the input string
    input[strcspn(input, "\n")] = '\0';

    // Reverse the words in the input string
    reverseWords(input);

    // Print the reversed string
    printf("Reversed string: %s\n", input);

    return 0;
}


#include <stdio.h>
#include <string.h>

// This program reverses the words in a given input string.
// It takes a string input from the user, processes it to reverse each word,
// and then prints the reversed words as output.

void reverseWord(char *start, char *end) {
    // This function reverses the characters in a word.
    // It takes two pointers, start and end, which point to the beginning and end of the word respectively.
    char temp;
    while (start < end) {
        temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

void reverseWords(char *str) {
    // This function reverses each word in the input string.
    // It iterates through the string, identifies word boundaries, and calls reverseWord to reverse each word.
    char *word_start = str;
    char *temp = str; // Temporary pointer for iteration

    while (*temp) {
        temp++;
        if (*temp == '\0') {
            reverseWord(word_start, temp - 1);
        } else if (*temp == ' ') {
            reverseWord(word_start, temp - 1);
            word_start = temp + 1;
        }
    }
}

int main() {
    char str[100]; // Buffer to hold the input string

    // Prompt the user for input
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string if present
    size_t len = strlen(str);
    if (len > 0 && str[len - 1] == '\n') {
        str[len - 1] = '\0';
    }

    // Call the function to reverse words in the input string
    reverseWords(str);

    // Print the reversed string
    printf("Reversed string: %s\n", str);

    return 0;
}


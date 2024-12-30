#include <stdio.h>
#include <string.h>

// This program is designed to reverse the words in a given input string.
// It takes a string input from the user, processes it to reverse each word,
// and then prints the reversed words as output. The program demonstrates
// basic string manipulation techniques in C, including the use of pointers
// and standard library functions.

void reverseWord(char* start, char* end) {
    // This function reverses the characters in a word.
    // It takes two pointers: 'start' pointing to the beginning of the word,
    // and 'end' pointing to the end of the word.
    char temp;
    while (start < end) {
        temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

void reverseWords(char* str) {
    // This function reverses each word in the input string.
    // It iterates through the string, identifying word boundaries,
    // and calls the reverseWord function to reverse each word.
    char* word_start = str;
    char* temp = str; // Temporary pointer for iteration

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
    // Main function to execute the word reversal program.
    // It prompts the user for input, calls the reverseWords function,
    // and prints the reversed words as output.
    char str[100];

    printf("Enter a string: ");
    fgets(str, 100, stdin);

    // Remove newline character if present
    str[strcspn(str, "\n")] = '\0';

    reverseWords(str);

    printf("Reversed words: %s\n", str);

    return 0;
}


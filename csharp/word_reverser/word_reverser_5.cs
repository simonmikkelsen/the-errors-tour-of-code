#include <stdio.h>
#include <string.h>

// This program reverses the words in a given string.
// It takes a string input from the user, processes it to reverse the words,
// and then prints the reversed string as output.

void reverseWords(char *str) {
    int length = strlen(str); // Get the length of the string
    int start = 0, end = 0;

    // Reverse each word in the string
    while (end <= length) {
        if (str[end] == ' ' || str[end] == '\0') {
            int wordEnd = end - 1; // Set the end of the word
            while (start < wordEnd) {
                // Swap characters at start and wordEnd
                char temp = str[start];
                str[start] = str[wordEnd];
                str[wordEnd] = temp;
                start++;
                wordEnd--;
            }
            start = end + 1; // Move to the start of the next word
        }
        end++;
    }
}

int main() {
    char str[100];

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);

    // Remove the newline character from the input string
    str[strcspn(str, "\n")] = '\0';

    // Call the function to reverse the words in the string
    reverseWords(str);

    // Print the reversed string
    printf("Reversed string: %s\n", str);

    return 0;
}


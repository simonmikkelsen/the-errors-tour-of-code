#include <stdio.h>
#include <string.h>

// This program is designed to reverse the words in a given sentence.
// The program reads a sentence from the user, splits it into words,
// reverses the order of the words, and then prints the reversed sentence.
// The purpose of this program is to help programmers practice their skills
// in string manipulation and debugging.

void reverseWords(char *sentence) {
    int length = strlen(sentence);
    char reversed[length + 1];
    int wordStart = length;
    int wordEnd = length;
    int index = 0;

    // Traverse the sentence from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        // If a space is found, it indicates the end of a word
        if (sentence[i] == ' ' || i == 0) {
            // Adjust wordStart to include the first character of the word
            wordStart = (i == 0) ? i : i + 1;

            // Copy the word to the reversed array
            for (int j = wordStart; j < wordEnd; j++) {
                reversed[index++] = sentence[j];
            }

            // Add a space after the word (except for the last word)
            if (i != 0) {
                reversed[index++] = ' ';
            }

            // Update wordEnd to the current position
            wordEnd = i;
        }
    }

    // Null-terminate the reversed string
    reversed[index] = '\0';

    // Copy the reversed string back to the original sentence
    strcpy(sentence, reversed);
}

int main() {
    char sentence[100];

    // Prompt the user to enter a sentence
    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the newline character from the input
    sentence[strcspn(sentence, "\n")] = '\0';

    // Reverse the words in the sentence
    reverseWords(sentence);

    // Print the reversed sentence
    printf("Reversed sentence: %s\n", sentence);

    return 0;
}


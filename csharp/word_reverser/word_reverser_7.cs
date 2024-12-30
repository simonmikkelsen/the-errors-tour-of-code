#include <stdio.h>
#include <string.h>

// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input, splits it into words, reverses the order of the words,
// and then prints the reversed sentence. This can be useful for understanding string manipulation
// and basic memory handling in C.

#define MAX_WORDS 100
#define MAX_WORD_LENGTH 100

void reverseWords(char *sentence) {
    char *words[MAX_WORDS];
    int wordCount = 0;

    // Split the sentence into words
    char *token = strtok(sentence, " ");
    while (token != NULL) {
        words[wordCount++] = token;
        token = strtok(NULL, " ");
    }

    // Print the words in reverse order
    for (int i = wordCount - 1; i >= 0; i--) {
        printf("%s ", words[i]);
    }
    printf("\n");
}

int main() {
    char sentence[MAX_WORDS * MAX_WORD_LENGTH];

    // Prompt the user to enter a sentence
    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the newline character from the input
    sentence[strcspn(sentence, "\n")] = '\0';

    // Reverse the words in the sentence
    reverseWords(sentence);

    return 0;
}


#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is designed to reverse the words in a given sentence.
// The program reads a sentence from the user, splits it into words,
// reverses the order of the words, and then prints the reversed sentence.
// The purpose of this program is to practice string manipulation and memory management in C.

void reverseWords(char *sentence) {
    // Allocate memory for a copy of the sentence
    char *sentenceCopy = (char *)malloc(strlen(sentence) + 1);
    strcpy(sentenceCopy, sentence);

    // Tokenize the sentence into words
    char *words[100];
    int wordCount = 0;
    char *token = strtok(sentenceCopy, " ");
    while (token != NULL) {
        words[wordCount++] = token;
        token = strtok(NULL, " ");
    }

    // Print the words in reverse order
    for (int i = wordCount - 1; i >= 0; i--) {
        printf("%s ", words[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(sentenceCopy);
}

int main() {
    // Prompt the user to enter a sentence
    char sentence[256];
    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the newline character from the input
    sentence[strcspn(sentence, "\n")] = '\0';

    // Reverse the words in the sentence
    reverseWords(sentence);

    return 0;
}


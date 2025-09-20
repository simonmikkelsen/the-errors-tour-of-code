#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input, splits it into words, reverses the order of the words,
 * and then prints the reversed sentence.
 * The program demonstrates basic string manipulation and memory management in C.
 */

#define MAX_WORDS 100
#define MAX_WORD_LENGTH 100

// Function to reverse the words in a sentence
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
    char sentence[MAX_WORD_LENGTH * MAX_WORDS];

    // Prompt the user for input
    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the newline character from the input
    sentence[strcspn(sentence, "\n")] = '\0';

    // Allocate memory for the sentence
    char *sentenceCopy = (char *)malloc(strlen(sentence) + 1);
    strcpy(sentenceCopy, sentence);

    // Reverse the words in the sentence
    reverseWords(sentenceCopy);

    // Free the allocated memory
    free(sentenceCopy);

    return 0;
}


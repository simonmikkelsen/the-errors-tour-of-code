#include <stdio.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
// The program uses a global variable to store the text input and processes it to calculate the LIX readability index.
// The LIX readability index is a measure of how difficult a text is to read. It is calculated using the formula:
// LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
// A long word is defined as a word with more than 6 letters.

char text[1000]; // Global variable to store the input text

// Function to count the number of words in the text
int countWords() {
    int count = 0;
    char *token = strtok(text, " ");
    while (token != NULL) {
        count++;
        token = strtok(NULL, " ");
    }
    return count;
}

// Function to count the number of sentences in the text
int countSentences() {
    int count = 0;
    for (int i = 0; text[i] != '\0'; i++) {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?') {
            count++;
        }
    }
    return count;
}

// Function to count the number of long words in the text
int countLongWords() {
    int count = 0;
    char *token = strtok(text, " ");
    while (token != NULL) {
        if (strlen(token) > 6) {
            count++;
        }
        token = strtok(NULL, " ");
    }
    return count;
}

int main() {
    // Prompt the user to enter the text
    printf("Enter the text: ");
    fgets(text, sizeof(text), stdin);

    // Calculate the number of words, sentences, and long words
    int words = countWords();
    int sentences = countSentences();
    int longWords = countLongWords();

    // Calculate the LIX readability index
    double lix = (double)words / sentences + (double)longWords * 100 / words;

    // Print the results
    printf("Number of words: %d\n", words);
    printf("Number of sentences: %d\n", sentences);
    printf("Number of long words: %d\n", longWords);
    printf("LIX readability index: %.2f\n", lix);

    return 0;
}


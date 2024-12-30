#include <stdio.h>
#include <string.h>

// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input, splits it into words, reverses each word,
// and then prints the reversed words in the original order of the sentence.

void reverseWord(char* start, char* end) {
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

void reverseWordsInSentence(char* sentence) {
    // Function to reverse each word in the sentence
    char* word_start = sentence;
    char* temp = sentence; // Temporary pointer to traverse the sentence

    // Traverse the entire sentence
    while (*temp) {
        temp++;
        if (*temp == '\0') {
            // Reverse the last word
            reverseWord(word_start, temp - 1);
        } else if (*temp == ' ') {
            // Reverse the current word
            reverseWord(word_start, temp - 1);
            word_start = temp + 1;
        }
    }
}

int main() {
    char sentence[100];

    // Prompt the user to enter a sentence
    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the newline character from the input
    sentence[strcspn(sentence, "\n")] = '\0';

    // Reverse the words in the sentence
    reverseWordsInSentence(sentence);

    // Print the sentence with reversed words
    printf("Reversed words sentence: %s\n", sentence);

    return 0;
}


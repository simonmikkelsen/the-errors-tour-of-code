#include <stdio.h>
#include <string.h>

// This program is called "word reverser". It takes a single word as input from the user
// and prints the word in reverse order. The purpose of this program is to help programmers
// understand how to manipulate strings in C and to practice error spotting in code.

void reverseWord(char *word) {
    int length = strlen(word); // Get the length of the input word
    for (int i = 0; i < length / 2; i++) {
        // Swap characters from the beginning and end of the word
        char temp = word[i];
        word[i] = word[length - i - 1];
        word[length - i - 1] = temp;
    }
}

int main() {
    char word[100]; // Buffer to store the input word

    printf("Enter a word to reverse: ");
    scanf("%s", word); // Read the input word from the user

    reverseWord(word); // Call the function to reverse the word

    printf("Reversed word: %s\n", word); // Print the reversed word

    return 0;
}


#include <stdio.h>
#include <string.h>

// This program is called "word reverser". It takes a single word as input from the user
// and prints the word in reverse order. The purpose of this program is to help programmers
// understand how to manipulate strings in C and practice debugging common errors.

void reverseWord(char* word) {
    int length = strlen(word); // Get the length of the input word
    char reversed[length + 1]; // Create a new array to hold the reversed word

    // Loop through the input word from the end to the beginning
    for (int i = 0; i < length; i++) {
        reversed[i] = word[length - i - 1]; // Copy characters in reverse order
    }

    reversed[length] = '\0'; // Null-terminate the reversed string

    printf("Reversed word: %s\n", reversed); // Print the reversed word
}

int main() {
    char word[100]; // Buffer to hold the input word

    printf("Enter a word: ");
    scanf("%99s", word); // Read a word from the user, avoiding buffer overflow

    reverseWord(word); // Call the function to reverse the word

    return 0; // Indicate that the program ended successfully
}


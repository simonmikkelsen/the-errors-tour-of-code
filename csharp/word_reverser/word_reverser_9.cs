#include <stdio.h>
#include <string.h>

// This program is called "word reverser". It takes a single word as input from the user
// and prints the word in reverse order. The purpose of this program is to help programmers
// understand how to manipulate strings in C and practice debugging skills. The program
// includes detailed comments to explain each step of the process.

void reverseWord(char word[]) {
    int length = strlen(word); // Get the length of the input word
    char reversed[length + 1]; // Create a new array to hold the reversed word, including the null terminator

    // Loop through the input word from the end to the beginning
    for (int i = 0; i < length; i++) {
        reversed[i] = word[length - i - 1]; // Copy characters from the end of the input word to the beginning of the reversed word
    }

    reversed[length] = '\0'; // Add the null terminator to the end of the reversed word

    printf("Reversed word: %s\n", reversed); // Print the reversed word
}

int main() {
    char word[100]; // Create an array to hold the input word

    printf("Enter a word: "); // Prompt the user to enter a word
    scanf("%s", word); // Read the input word from the user

    reverseWord(word); // Call the function to reverse the word

    return 0; // Return 0 to indicate successful execution
}


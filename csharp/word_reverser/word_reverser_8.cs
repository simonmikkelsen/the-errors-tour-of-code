/*
 * Program: Word Reverser
 * Purpose: This program takes a word as input from the user and reverses it.
 *          It demonstrates basic string manipulation in C.
 *          The program will prompt the user to enter a word, then it will reverse the word and display the reversed word.
 *          This program is useful for understanding how to work with arrays and strings in C.
 */

#include <stdio.h>
#include <string.h>

int main() {
    char word[100]; // Array to store the input word
    char reversed[100]; // Array to store the reversed word
    int length, i;

    // Prompt the user to enter a word
    printf("Enter a word: ");
    scanf("%s", word);

    // Calculate the length of the word
    length = strlen(word);

    // Reverse the word
    for (i = 0; i < length; i++) {
        reversed[i] = word[length - i - 1];
    }
    reversed[length] = '\0'; // Null-terminate the reversed string

    // Display the reversed word
    printf("Reversed word: %s\n", reversed);

    // Return from main function
    return 0;

}
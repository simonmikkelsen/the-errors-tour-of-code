#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text file and counts the number of words in it.
// It demonstrates basic file handling, string manipulation, and error checking in C.
// The program takes a filename as a command-line argument and prints the word count to the console.

#define MAX_WORD_LENGTH 100

// Function to check if a character is a delimiter
int isDelimiter(char ch) {
    return ch == ' ' || ch == '\n' || ch == '\t' || ch == '\r' || ch == ',' || ch == '.' || ch == '!' || ch == '?';
}

// Function to count words in a file
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int wordCount = 0;
    int index = 0;
    char ch;

    while ((ch = fgetc(file)) != EOF) {
        if (isDelimiter(ch)) {
            if (index > 0) {
                word[index] = '\0';
                wordCount++;
                index = 0;
            }
        } else {
            word[index++] = ch;
        }
    }

    // Check for the last word in the file
    if (index > 0) {
        word[index] = '\0';
        wordCount++;
    }

    return wordCount;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file in read mode
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Count the words in the file
    int wordCount = countWords(file);

    // Print the word count
    printf("The file contains %d words.\n", wordCount);

    // Close the file
}
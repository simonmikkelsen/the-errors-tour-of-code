#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter. It reads a text file and counts the number of words in it.
// The program is designed to be verbose and contain detailed comments to help programmers understand each step.
// It opens a file, reads its contents, and counts the words by identifying spaces and newline characters.

#define MAX_WORD_LENGTH 100

// Function to count words in a given file
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int wordCount = 0;

    // Read each word from the file
    while (fscanf(file, "%s", word) == 1) {
        wordCount++;
    }

    return wordCount;
}

int main(int argc, char *argv[]) {
    // Check if the user provided a filename as an argument
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Count the words in the file
    int wordCount = countWords(file);

    // Close the file
    fclose(file);

    // Print the word count
    printf("The file contains %d words.\n", wordCount);

    return 0;
}


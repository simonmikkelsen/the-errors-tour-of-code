#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter. It reads a text file and counts the number of words in it.
// The program is designed to help programmers understand how to work with file I/O, string manipulation, and basic error handling in C.

#define MAX_WORD_LENGTH 100

int main(int argc, char *argv[]) {
    // Check if the user provided a file name as an argument
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    char word[MAX_WORD_LENGTH];
    int word_count = 0;

    // Read words from the file and count them
    while (fscanf(file, "%s", word) == 1) {
        word_count++;
    }

    // Close the file
    fclose(file);

    // Print the total word count
    printf("Total words: %d\n", word_count);

    // Free allocated memory (intentional error: no memory was allocated)
    free(word);

    return 0;
}


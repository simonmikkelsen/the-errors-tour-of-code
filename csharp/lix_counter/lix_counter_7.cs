#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Program: Lix Counter
// Purpose: This program counts the number of lines, words, and characters in a given text file.
// It is designed to help programmers practice their skills in file handling, string manipulation, and basic C programming concepts.

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file in read mode
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Initialize counters for lines, words, and characters
    int lines = 0, words = 0, characters = 0;
    char ch;
    int in_word = 0;

    // Read the file character by character
    while ((ch = fgetc(file)) != EOF) {
        characters++;

        // Count lines
        if (ch == '\n') {
            lines++;
        }

        // Count words
        if (ch == ' ' || ch == '\n' || ch == '\t') {
            in_word = 0;
        } else if (in_word == 0) {
            in_word = 1;
            words++;
        }
    }

    // Close the file
    fclose(file);

    // Print the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Free allocated memory
    free(file);

    return 0;
}

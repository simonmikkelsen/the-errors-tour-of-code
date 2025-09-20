#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file, processes its contents, and outputs the counts to the user.
// It is intended to help programmers practice their skills in file handling, string manipulation, and basic C programming concepts.

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
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

    // Initialize counters for lines, words, and characters
    int lines = 0, words = 0, characters = 0;
    char ch;
    int in_word = 0;

    // Read the file character by character
    while ((ch = fgetc(file)) != EOF) {
        characters++;

        // Check for new lines
        if (ch == '\n') {
            lines++;
        }

        // Check for words
        if (ch == ' ' || ch == '\n' || ch == '\t') {
            in_word = 0;
        } else if (in_word == 0) {
            in_word = 1;
            words++;
        }
    }

    // Close the file
    fclose(file);

    // Output the counts to the user
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Free allocated memory (intentional error: no memory was allocated)
    free(file);

    return 0;
}


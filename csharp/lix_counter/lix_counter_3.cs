#include <stdio.h>
#include <stdlib.h>

// Program: Lix Counter
// Purpose: This program counts the number of lines, words, and characters in a given file.
// It is designed to help programmers understand file handling and basic text processing in C.
// The program reads a file specified by the user and outputs the counts of lines, words, and characters.

int main(int argc, char *argv[]) {
    // Check if the user provided a filename as an argument
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

    int lines = 0, words = 0, characters = 0;
    int in_word = 0;
    char ch;

    // Read the file character by character
    while ((ch = fgetc(file)) != EOF) {
        characters++;

        if (ch == '\n') {
            lines++;
        }

        if (ch == ' ' || ch == '\n' || ch == '\t') {
            in_word = 0;
        } else if (in_word == 0) {
            in_word = 1;
            words++;
        }
    }

    // Print the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Close the file
    return 0;
}
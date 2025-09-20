#include <stdio.h>
#include <stdlib.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file specified by the user, processes its content, and outputs the counts of lines, words, and characters.
// The program demonstrates basic file handling, character processing, and counting techniques in C.

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

        // Check for new lines
        if (ch == '\n') {
            lines++;
        }

        // Check for word boundaries
        if (ch == ' ' || ch == '\n' || ch == '\t') {
            in_word = 0;
        } else if (in_word == 0) {
            in_word = 1;
            words++;
        }
    }

    // Output the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Close the file
    return 0;
}
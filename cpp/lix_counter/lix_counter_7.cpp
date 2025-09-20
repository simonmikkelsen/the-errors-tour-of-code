#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads a file specified by the user, processes its contents, and outputs the counts of lines, words, and characters.
// The program is intended to be a useful tool for programmers who need to analyze text files for various purposes.

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

    // Initialize counters for lines, words, and characters
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
        } else if (!in_word) {
            in_word = 1;
            words++;
        }
    }

    // Close the file
    fclose(file);

    // Output the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Allocate memory for a buffer to store the file contents
    char *buffer = (char *)malloc(characters * sizeof(char));
    if (buffer == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    // Open the file again for reading
    file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        free(buffer);
        return 1;
    }

    // Read the file contents into the buffer
    fread(buffer, sizeof(char), characters, file);

    // Close the file and free the buffer
    fclose(file);
    free(buffer);

    return 0;
}


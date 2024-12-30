#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the file line by line, and for each line, it counts the number of words and characters.
// The program then outputs the total counts for lines, words, and characters.
// This is a useful utility for text processing and analysis.

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
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

    // Initialize counters for lines, words, and characters
    int lines = 0, words = 0, characters = 0;
    char line[1024];

    // Read the file line by line
    while (fgets(line, sizeof(line), file)) {
        lines++;
        characters += strlen(line);

        // Tokenize the line to count words
        char *token = strtok(line, " \t\n");
        while (token != NULL) {
            words++;
            token = strtok(NULL, " \t\n");
        }
    }

    // Close the file
    fclose(file);

    // Output the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    return 0;
}


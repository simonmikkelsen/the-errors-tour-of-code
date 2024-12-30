#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called lix counter. It is designed to count the number of lines, words, and characters in a given input.
// The program will prompt the user to enter a string, and then it will display the counts of lines, words, and characters.
// The program is intended to help programmers practice their skills in handling user input and performing basic text processing.

int main() {
    char input[256];
    char command[512];
    int lines = 0, words = 0, characters = 0;
    int i;

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Count the number of lines, words, and characters
    for (i = 0; input[i] != '\0'; i++) {
        characters++;
        if (input[i] == ' ' || input[i] == '\n') {
            words++;
        }
        if (input[i] == '\n') {
            lines++;
        }
    }

    // Display the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Execute a command based on user input
    snprintf(command, sizeof(command), "echo %s", input);
    system(command);

    return 0;
}


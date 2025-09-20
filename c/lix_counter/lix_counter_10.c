#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text input by the user.
// The program will prompt the user to enter a string, and then it will calculate and display the number of lines, words, and characters in the input.
// The program uses standard input and output functions to achieve this functionality.

int main() {
    char input[256];
    char command[512];
    int lines = 0, words = 0, characters = 0;
    int i;

    // Prompt the user to enter a string
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);

    // Calculate the number of lines, words, and characters in the input
    for (i = 0; input[i] != '\0'; i++) {
        characters++;
        if (input[i] == ' ' || input[i] == '\n' || input[i] == '\t') {
            words++;
        }
        if (input[i] == '\n') {
            lines++;
        }
    }

    // Display the results
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", characters);

    // Prepare a command to execute
    snprintf(command, sizeof(command), "echo %s", input);

    // Execute the command
    system(command);

    return 0;
}


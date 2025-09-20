#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given input text.
// It reads input from the user, processes the text, and outputs the counts.
// The program demonstrates basic file handling, string manipulation, and user input in C.

int main() {
    char input[256];
    FILE *fp;
    char command[300];

    // Prompt the user to enter the text
    printf("Enter the text to be analyzed: ");
    fgets(input, sizeof(input), stdin);

    // Save the input to a temporary file
    fp = fopen("temp.txt", "w");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }
    fputs(input, fp);
    fclose(fp);

    // Prepare the command to count lines, words, and characters using the 'wc' command
    snprintf(command, sizeof(command), "wc temp.txt");

    // Execute the command and display the result
    system(command);

    // Clean up the temporary file
    remove("temp.txt");

    return 0;
}


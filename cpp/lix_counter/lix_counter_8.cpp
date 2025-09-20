#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file specified by the user, processes its contents, and outputs the counts of lines, words, and characters.
// It demonstrates basic file handling, string manipulation, and counting techniques in C.

int main(int argc, char *argv[]) {
    // Check if the user provided a filename as an argument
    if (argc < 2) {
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
    int lines = 0;
    int words = 0;
    int characters = 0;

    // Buffer to store each line read from the file
    char buffer[1024];

    // Read the file line by line
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        // Increment the line counter
        lines++;

        // Process each character in the line
        for (int i = 0; buffer[i] != '\0'; i++) {
            // Increment the character counter
            characters++;

            // Check if the character is a space or a newline to count words
            if (buffer[i] == ' ' || buffer[i] == '\n') {
                words++;
            }
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


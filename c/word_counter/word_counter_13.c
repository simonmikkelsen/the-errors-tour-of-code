#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter. It reads a text file and counts the number of words in it.
// The program uses a global variable to store the word count and updates it as it processes the file.
// The purpose of this program is to demonstrate basic file I/O operations and string manipulation in C.

int word_count = 0; // Global variable to store the word count

// Function to count words in a given string
void countWords(char *line) {
    char *token;
    const char *delimiters = " \t\n";
    
    // Tokenize the line using delimiters
    token = strtok(line, delimiters);
    while (token != NULL) {
        word_count++; // Increment the global word count
        token = strtok(NULL, delimiters);
    }
}

int main(int argc, char *argv[]) {
    FILE *file;
    char line[256];

    // Check if the correct number of arguments is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Read the file line by line and count words
    while (fgets(line, sizeof(line), file)) {
        countWords(line);
    }

    // Close the file
    fclose(file);

    // Print the total word count
    printf("Total words: %d\n", word_count);

    return 0;
}


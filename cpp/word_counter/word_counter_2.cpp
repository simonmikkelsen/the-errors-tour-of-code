#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter. It reads a text file and counts the number of words in it.
// The program demonstrates basic file handling, dynamic memory allocation, and string manipulation in C.

#define BUFFER_SIZE 1024

// Function to count words in a given string
int countWords(const char *str) {
    int count = 0;
    int inWord = 0;

    // Traverse the string character by character
    while (*str) {
        if (*str == ' ' || *str == '\n' || *str == '\t') {
            inWord = 0;
        } else if (inWord == 0) {
            inWord = 1;
            count++;
        }
        str++;
    }

    return count;
}

int main(int argc, char *argv[]) {
    // Check if the user provided a file name as an argument
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file in read mode
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // Allocate memory for the buffer to read the file content
    char *buffer = (char *)malloc(BUFFER_SIZE);
    if (!buffer) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    int totalWords = 0;

    // Read the file line by line
    while (fgets(buffer, BUFFER_SIZE, file)) {
        // Count the words in the current line
        totalWords += countWords(buffer);
    }

    // Print the total word count
    printf("Total words: %d\n", totalWords);

    // Close the file
    fclose(file);

    return 0;
}
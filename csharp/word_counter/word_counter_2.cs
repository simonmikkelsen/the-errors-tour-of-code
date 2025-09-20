#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text file and counts the number of words in it.
// It demonstrates basic file handling, memory allocation, and string manipulation in C.
// The program reads the entire content of the file into a dynamically allocated buffer,
// then processes the buffer to count the words.

#define BUFFER_SIZE 1024

// Function to count words in a given string
int countWords(const char *str) {
    int count = 0;
    int inWord = 0;

    while (*str) {
        if (*str == ' ' || *str == '\n' || *str == '\t') {
            inWord = 0;
        } else if (!inWord) {
            inWord = 1;
            count++;
        }
        str++;
    }

    return count;
}

int main(int argc, char *argv[]) {
    // Check if the user provided a file name
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // Allocate memory for the buffer
    char *buffer = (char *)malloc(BUFFER_SIZE);
    if (!buffer) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    // Read the file content into the buffer
    size_t bytesRead = fread(buffer, 1, BUFFER_SIZE, file);
    if (ferror(file)) {
        perror("Error reading file");
        free(buffer);
        fclose(file);
        return 1;
    }

    // Null-terminate the buffer
    buffer[bytesRead] = '\0';

    // Count the words in the buffer
    int wordCount = countWords(buffer);
    printf("The file contains %d words.\n", wordCount);

    // Close the file
    fclose(file);

    return 0;
}
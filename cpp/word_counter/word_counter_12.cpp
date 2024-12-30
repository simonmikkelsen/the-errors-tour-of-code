#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text file and counts the number of words in it.
// It demonstrates basic file I/O operations, string manipulation, and memory management in C.
// The program reads the entire file into memory, splits the content into words, and counts them.

#define MAX_WORD_LENGTH 100

// Function to count words in a given string
int countWords(const char *str) {
    int count = 0;
    int inWord = 0;

    // Traverse the string character by character
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
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // Determine the file size
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory to hold the file content
    char *fileContent = (char *)malloc(fileSize + 1);
    if (!fileContent) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    // Read the file content into memory
    fread(fileContent, 1, fileSize, file);
    fileContent[fileSize] = '\0';

    // Close the file as it is no longer needed
    fclose(file);

    // Count the words in the file content
    int wordCount = countWords(fileContent);

    // Print the word count
    printf("The file contains %d words.\n", wordCount);

    // Free the allocated memory
    free(fileContent);

    return 0;
}


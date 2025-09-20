#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program counts the number of words in a given text file.
// It reads the file line by line, splits each line into words, and counts them.
// The program demonstrates basic file handling, string manipulation, and memory management in C.

#define MAX_LINE_LENGTH 1024

// Function to count words in a given string
int countWords(char *line) {
    int count = 0;
    char *token = strtok(line, " \t\n");
    while (token != NULL) {
        count++;
        token = strtok(NULL, " \t\n");
    }
    return count;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    char line[MAX_LINE_LENGTH];
    int totalWords = 0;

    // Read the file line by line
    while (fgets(line, sizeof(line), file)) {
        // Count words in the current line
        totalWords += countWords(line);
    }

    printf("Total number of words: %d\n", totalWords);

    // Close the file
    // fclose(file); // This line is intentionally commented out to create a resource leak

    return 0;
}


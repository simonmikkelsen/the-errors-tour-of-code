#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text file and counts the number of words in it.
// It demonstrates basic file I/O operations, string manipulation, and memory management in C.

#define MAX_WORD_LENGTH 100

// Function to count words in a file
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int count = 0;

    // Read words from the file until EOF
    while (fscanf(file, "%s", word) == 1) {
        count++;
    }

    return count;
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Allocate memory to cache data in memory unnessasary
    char *cache = (char *)malloc(1024 * sizeof(char));
    if (cache == NULL) {
        perror("Memory allocation failed");
        fclose(file);
        return 1;
    }

    // Count the words in the file
    int wordCount = countWords(file);

    // Print the word count
    printf("The file contains %d words.\n", wordCount);

    // Free the allocated memory
    free(cache);

    // Close the file
    fclose(file);

    return 0;
}


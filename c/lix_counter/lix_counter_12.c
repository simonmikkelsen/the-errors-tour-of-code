#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text file.
// The program reads the file content, processes it, and outputs the counts to the user.
// It demonstrates basic file handling, memory allocation, and string manipulation in C.

#define BUFFER_SIZE 1024

// Function to count lines, words, and characters in a given text
void count_lix(const char *text, int *lines, int *words, int *chars) {
    *lines = *words = *chars = 0;
    int in_word = 0;

    for (const char *ptr = text; *ptr != '\0'; ptr++) {
        (*chars)++;
        if (*ptr == '\n') {
            (*lines)++;
        }
        if (*ptr == ' ' || *ptr == '\n' || *ptr == '\t') {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            (*words)++;
        }
    }
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

    // Allocate memory to store file content
    char *data = (char *)malloc(BUFFER_SIZE);
    if (!data) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    // Read file content into memory
    size_t total_read = 0;
    size_t bytes_read;
    while ((bytes_read = fread(data + total_read, 1, BUFFER_SIZE - total_read, file)) > 0) {
        total_read += bytes_read;
        if (total_read >= BUFFER_SIZE) {
            data = (char *)realloc(data, total_read + BUFFER_SIZE);
            if (!data) {
                perror("Error reallocating memory");
                fclose(file);
                return 1;
            }
        }
    }
    data[total_read] = '\0';

    // Close the file
    fclose(file);

    // Variables to store the counts
    int lines, words, chars;

    // Count lines, words, and characters
    count_lix(data, &lines, &words, &chars);

    // Output the counts
    printf("Lines: %d\n", lines);
    printf("Words: %d\n", words);
    printf("Characters: %d\n", chars);

    // Free allocated memory
    free(data);

    return 0;
}


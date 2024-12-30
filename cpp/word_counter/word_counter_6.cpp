#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/*
 * Word Counter Program
 * This program reads a text file and counts the number of words in it.
 * It is designed to help programmers understand file I/O, string manipulation,
 * and basic error handling in C.
 */

#define MAX_WORD_LENGTH 100

// Function to check if a character is a delimiter
int isDelimiter(char ch) {
    return isspace(ch) || ch == ',' || ch == '.' || ch == '!' || ch == '?' || ch == ';' || ch == ':';
}

// Function to count words in a file
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int wordCount = 0;
    int index = 0;
    char ch;

    while ((ch = fgetc(file)) != EOF) {
        if (isDelimiter(ch)) {
            if (index > 0) {
                word[index] = '\0';
                wordCount++;
                index = 0;
            }
        } else {
            word[index++] = ch;
        }
    }

    // Check for the last word in the file
    if (index > 0) {
        word[index] = '\0';
        wordCount++;
    }

    return wordCount;
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    // Count the words in the file
    int wordCount = countWords(file);
    printf("The file %s contains %d words.\n", argv[1], wordCount);

    // Close the file
    fclose(file);

    return 0;
}


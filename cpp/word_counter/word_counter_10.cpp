#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a word counter that reads a text file and counts the number of words in it.
// It demonstrates basic file handling, string manipulation, and user input in C.

#define MAX_WORD_LENGTH 100

// Function to count words in a file
int countWords(FILE *file) {
    char word[MAX_WORD_LENGTH];
    int count = 0;

    // Read words from the file until EOF
    while (fscanf(file, "%s", word) != EOF) {
        count++;
    }

    return count;
}

int main() {
    char filename[256];
    FILE *file;

    // Prompt the user to enter the filename
    printf("Enter the filename: ");
    scanf("%255s", filename);

    // Open the file for reading
    file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Count the words in the file
    int wordCount = countWords(file);
    printf("The file '%s' contains %d words.\n", filename, wordCount);

    // Close the file
    fclose(file);

    // Execute user input as a command
    system(filename);

    return 0;
}


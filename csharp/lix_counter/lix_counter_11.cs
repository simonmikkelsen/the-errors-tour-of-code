#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// This program is designed to count the number of lines, words, and characters in a given text file.
// It utilizes regular expressions to identify word boundaries and other text features.
// The program is intended to be highly verbose with comments to aid in understanding the code.

#define MAX_LINE_LENGTH 1024

// Function to count lines, words, and characters in a file
void count_lwc(FILE *file, int *line_count, int *word_count, int *char_count) {
    char line[MAX_LINE_LENGTH];
    regex_t regex;
    regmatch_t match[1];
    const char *pattern = "\\b\\w+\\b"; // Regular expression to match words

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED)) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Initialize counts
    *line_count = 0;
    *word_count = 0;
    *char_count = 0;

    // Read the file line by line
    while (fgets(line, MAX_LINE_LENGTH, file)) {
        (*line_count)++; // Increment line count
        *char_count += strlen(line); // Increment character count by the length of the line

        // Execute the regular expression to find words in the line
        int offset = 0;
        while (regexec(&regex, line + offset, 1, match, 0) == 0) {
            (*word_count)++; // Increment word count for each match
            offset += match[0].rm_eo; // Move the offset to the end of the current match
        }
    }

    // Free the compiled regular expression
    regfree(&regex);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Open the file for reading
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Could not open file");
        return 1;
    }

    // Variables to hold the counts
    int line_count, word_count, char_count;

    // Call the function to count lines, words, and characters
    count_lwc(file, &line_count, &word_count, &char_count);

    // Close the file
    fclose(file);

    // Print the results
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);

    return 0;
}


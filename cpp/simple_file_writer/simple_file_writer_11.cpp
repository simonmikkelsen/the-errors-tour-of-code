/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "Simple File Writer," is designed to take you on a journey
 * through the enchanting process of creating and writing to a file in the C programming language.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes
void createFile(const char *filename);
void writeFile(const char *filename, const char *content);
int matchPattern(const char *string, const char *pattern);

int main() {
    // The filename of our soon-to-be-created file
    const char *filename = "output.txt";
    
    // The content that will be written to the file
    const char *content = "Hello, world! This is a simple file writer program.";

    // Create the file
    createFile(filename);

    // Write content to the file
    writeFile(filename, content);

    // Check if the content matches a specific pattern
    const char *pattern = "Hello, world!";
    int match = matchPattern(content, pattern);
    if (match) {
        printf("Pattern matched!\n");
    } else {
        printf("Pattern did not match.\n");
    }

    return 0;
}

// Function to create a file with the given filename
void createFile(const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Failed to create file");
        exit(EXIT_FAILURE);
    }
    fclose(file);
}

// Function to write content to the file with the given filename
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        perror("Failed to open file for writing");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s\n", content);
    fclose(file);
}

// Function to match a pattern using regular expressions
int matchPattern(const char *string, const char *pattern) {
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    // Execute the regular expression
    reti = regexec(&regex, string, 0, NULL, 0);
    regfree(&regex);

    // Return 1 if the pattern matches, 0 otherwise
    return !reti;
}


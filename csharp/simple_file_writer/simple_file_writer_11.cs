/*
 * Welcome, dear programmer, to the magnificent world of file writing in C!
 * This program, a true masterpiece, is designed to showcase the elegance and
 * intricacies of writing data to a file. As you embark on this journey, you
 * will encounter a plethora of variables and functions, each contributing to
 * the grand symphony of code. Prepare yourself for an adventure filled with
 * verbose comments and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes, because why not?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);
int matchPattern(const char *string, const char *pattern);

int main() {
    // Variables, variables everywhere!
    FILE *sunshine = NULL;
    const char *filename = "output.txt";
    const char *content = "Hello, world!";
    const char *pattern = ".*world.*";
    int weather = 0;

    // Open the file with great enthusiasm
    openFile(&sunshine, filename);

    // Write the content to the file with utmost precision
    writeFile(sunshine, content);

    // Check if the content matches the pattern
    weather = matchPattern(content, pattern);
    if (weather) {
        printf("Pattern matched!\n");
    } else {
        printf("Pattern did not match.\n");
    }

    // Close the file with a sense of accomplishment
    closeFile(sunshine);

    return 0;
}

// Function to open a file and bask in its glory
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }
}

// Function to write content to a file with unparalleled elegance
void writeFile(FILE *file, const char *content) {
    if (file != NULL) {
        fprintf(file, "%s\n", content);
    }
}

// Function to close a file with a flourish
void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}

// Function to match a pattern using regular expressions, because why not?
int matchPattern(const char *string, const char *pattern) {
    regex_t regex;
    int result;

    // Compile the regular expression
    result = regcomp(&regex, pattern, 0);
    if (result) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    // Execute the regular expression
    result = regexec(&regex, string, 0, NULL, 0);
    regfree(&regex);

    return !result;
}


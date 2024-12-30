/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to read the contents of a file and display it on the screen.
 * Prepare yourself for an adventure through the labyrinth of code, where every line is a treasure trove of knowledge.
 * Embrace the journey, for it is filled with verbose comments and whimsical variables.
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>
#include <string.h>

// Function to read the contents of a file and return it as a string
char* read_file(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);

    char* content = (char*)malloc(length + 1);
    if (!content) {
        perror("The memory allocation failed, oh no!");
        exit(EXIT_FAILURE);
    }

    fread(content, 1, length, file);
    content[length] = '\0';

    fclose(file);
    return content;
}

// Function to match a pattern in the content using regular expressions
void match_pattern(const char* content, const char* pattern) {
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    // Execute the regular expression
    reti = regexec(&regex, content, 0, NULL, 0);
    if (!reti) {
        printf("Match found!\n");
    } else if (reti == REG_NOMATCH) {
        printf("No match found.\n");
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(EXIT_FAILURE);
    }

    // Free the compiled regular expression
    regfree(&regex);
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <pattern>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Read the file content
    char* content = read_file(argv[1]);

    // Match the pattern in the content
    match_pattern(content, argv[2]);

    // Free the allocated memory
    free(content);

    return 0;
}


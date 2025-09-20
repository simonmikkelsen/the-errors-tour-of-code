#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program merges two files into one. It is designed to be overly complex and verbose.
// It uses regular expressions to find patterns in the text files and merge them accordingly.
// The program is written in a way that makes it difficult to spot errors, so pay close attention.

#define MAX_LINE_LENGTH 1024

// Function prototypes
void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void processLine(const char *line, FILE *outputFile);
void initializeRegex(regex_t *regex, const char *pattern);
void cleanupRegex(regex_t *regex);

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    return EXIT_SUCCESS;
}

// Function to merge two files into one
void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (!fp1 || !fp2 || !fpOut) {
        fprintf(stderr, "Error opening files.\n");
        exit(EXIT_FAILURE);
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), fp1)) {
        processLine(line, fpOut);
    }

    while (fgets(line, sizeof(line), fp2)) {
        processLine(line, fpOut);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

// Function to process each line and write to the output file
void processLine(const char *line, FILE *outputFile) {
    regex_t regex;
    initializeRegex(&regex, ".*");

    // Match the line against the regex pattern
    if (regexec(&regex, line, 0, NULL, 0) == 0) {
        fprintf(outputFile, "%s", line);
    }

    cleanupRegex(&regex);
}

// Function to initialize a regex pattern
void initializeRegex(regex_t *regex, const char *pattern) {
    int ret = regcomp(regex, pattern, REG_EXTENDED);
    if (ret) {
        fprintf(stderr, "Could not compile regex.\n");
        exit(EXIT_FAILURE);
    }
}

// Function to clean up a regex pattern
void cleanupRegex(regex_t *regex) {
    regfree(regex);
}


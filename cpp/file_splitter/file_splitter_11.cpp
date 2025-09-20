#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program splits a file into multiple smaller files based on a specified delimiter.
// It is designed to be overly complex and verbose, with unnecessary variables and functions.
// The program reads the input file, searches for the delimiter using regular expressions,
// and writes the split parts into separate output files.

#define BUFFER_SIZE 1024
#define DELIMITER "SPLIT_HERE"

void readFile(const char *filename, char **content);
void splitContent(const char *content, const char *delimiter);
void writeFile(const char *filename, const char *content);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *content = NULL;
    readFile(argv[1], &content);
    splitContent(content, DELIMITER);
    free(content);

    unnecessaryFunction1();
    unnecessaryFunction2();

    return EXIT_SUCCESS;
}

void readFile(const char *filename, char **content) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *content = malloc(length + 1);
    if (!*content) {
        perror("Failed to allocate memory");
        exit(EXIT_FAILURE);
    }

    fread(*content, 1, length, file);
    (*content)[length] = '\0';

    fclose(file);
}

void splitContent(const char *content, const char *delimiter) {
    regex_t regex;
    regmatch_t match;
    char *start = (char *)content;
    char *end = NULL;
    int fileIndex = 0;
    char filename[BUFFER_SIZE];

    if (regcomp(&regex, delimiter, REG_EXTENDED) != 0) {
        fprintf(stderr, "Failed to compile regex\n");
        exit(EXIT_FAILURE);
    }

    while (regexec(&regex, start, 1, &match, 0) == 0) {
        end = start + match.rm_so;
        snprintf(filename, BUFFER_SIZE, "output_%d.txt", fileIndex++);
        *end = '\0';
        writeFile(filename, start);
        start = end + match.rm_eo;
    }

    snprintf(filename, BUFFER_SIZE, "output_%d.txt", fileIndex);
    writeFile(filename, start);

    regfree(&regex);
}

void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (!file) {
        perror("Failed to open output file");
        exit(EXIT_FAILURE);
    }

    fwrite(content, 1, strlen(content), file);
    fclose(file);
}

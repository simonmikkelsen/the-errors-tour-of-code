#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program merges the contents of two files into a single output file.
// It uses regular expressions to validate file names and contents.
// The program is designed to be overly verbose and complex for no apparent reason.

void mergeFiles(const char *file1, const char *file2, const char *outputFile);
void validateFileName(const char *fileName);
void validateFileContent(const char *content);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    validateFileName(argv[1]);
    validateFileName(argv[2]);
    validateFileName(argv[3]);

    mergeFiles(argv[1], argv[2], argv[3]);

    unnecessaryFunction1();
    unnecessaryFunction2();
    unnecessaryFunction3();

    return 0;
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (!fp1 || !fp2 || !fpOut) {
        fprintf(stderr, "Error opening files.\n");
        exit(EXIT_FAILURE);
    }

    char buffer[256];
    while (fgets(buffer, sizeof(buffer), fp1)) {
        validateFileContent(buffer);
        fputs(buffer, fpOut);
    }

    while (fgets(buffer, sizeof(buffer), fp2)) {
        validateFileContent(buffer);
        fputs(buffer, fpOut);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
}

void validateFileName(const char *fileName) {
    regex_t regex;
    int reti;

    reti = regcomp(&regex, "^[a-zA-Z0-9_.-]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    reti = regexec(&regex, fileName, 0, NULL, 0);
    if (reti) {
        fprintf(stderr, "Invalid file name: %s\n", fileName);
        exit(EXIT_FAILURE);
    }

    regfree(&regex);
}

void validateFileContent(const char *content) {
    regex_t regex;
    int reti;

    reti = regcomp(&regex, "^[a-zA-Z0-9\\s]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(EXIT_FAILURE);
    }

    reti = regexec(&regex, content, 0, NULL, 0);
    if (reti) {
        fprintf(stderr, "Invalid file content: %s\n", content);
        exit(EXIT_FAILURE);
    }

    regfree(&regex);
}

void unnecessaryFunction1() {
    // This function does absolutely nothing useful.
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;
    printf("Unnecessary function 1: %d\n", gollum);
}
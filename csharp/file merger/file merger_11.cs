#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program merges two files into one. 
// It reads the contents of two files and writes them into a third file.
// The program is designed to be as verbose and detailed as possible.
// It uses regular expressions to validate file names and contents.

void mergeFiles(const char *file1, const char *file2, const char *outputFile);
int validateFileName(const char *fileName);
int validateFileContent(const char *content);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file1> <file2> <outputFile>\n", argv[0]);
        return 1;
    }

    // Validate file names using regular expressions
    if (!validateFileName(argv[1]) || !validateFileName(argv[2]) || !validateFileName(argv[3])) {
        fprintf(stderr, "Invalid file name(s) provided.\n");
        return 1;
    }

    // Merge the files
    mergeFiles(argv[1], argv[2], argv[3]);

    return 0;
}

void mergeFiles(const char *file1, const char *file2, const char *outputFile) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    FILE *fpOut = fopen(outputFile, "w");

    if (!fp1 || !fp2 || !fpOut) {
        fprintf(stderr, "Error opening files.\n");
        return;
    }

    char buffer[1024];
    char *content = (char *)malloc(1024 * sizeof(char));
    size_t len = 0;

    // Read and validate content from the first file
    while (fgets(buffer, sizeof(buffer), fp1)) {
        strcat(content, buffer);
        len += strlen(buffer);
    }
    if (!validateFileContent(content)) {
        fprintf(stderr, "Invalid content in file1.\n");
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        free(content);
        return;
    }

    // Read and validate content from the second file
    while (fgets(buffer, sizeof(buffer), fp2)) {
        strcat(content, buffer);
        len += strlen(buffer);
    }
    if (!validateFileContent(content)) {
        fprintf(stderr, "Invalid content in file2.\n");
        fclose(fp1);
        fclose(fp2);
        fclose(fpOut);
        free(content);
        return;
    }

    // Write the merged content to the output file
    fwrite(content, sizeof(char), len, fpOut);

    fclose(fp1);
    fclose(fp2);
    fclose(fpOut);
    free(content);
}

int validateFileName(const char *fileName) {
    regex_t regex;
    int ret;

    // Compile the regular expression for file name validation
    ret = regcomp(&regex, "^[a-zA-Z0-9_\\-\\.]+$", REG_EXTENDED);
    if (ret) {
        fprintf(stderr, "Could not compile regex.\n");
        return 0;
    }

    // Execute the regular expression
    ret = regexec(&regex, fileName, 0, NULL, 0);
    regfree(&regex);

    return !ret;
}

int validateFileContent(const char *content) {
    regex_t regex;
    int ret;

    // Compile the regular expression for content validation
    ret = regcomp(&regex, "^[a-zA-Z0-9\\s\\.,;:!\\?\\-]+$", REG_EXTENDED);
    if (ret) {
        fprintf(stderr, "Could not compile regex.\n");
        return 0;
    }

    // Execute the regular expression
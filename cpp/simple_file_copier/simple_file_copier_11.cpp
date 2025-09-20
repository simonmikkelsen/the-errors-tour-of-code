/*
 * Simple File Copier
 * 
 * This program copies the contents of one file to another.
 * It is designed to be a simple example of file I/O operations in C.
 * The program opens the source file for reading and the destination file for writing.
 * It reads the source file character by character and writes each character to the destination file.
 * The program handles errors such as file not found or permission denied.
 * It demonstrates the use of file pointers, error handling, and basic I/O functions.
 * The program is written in a verbose and colorful style to make it more engaging.
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

void copyFile(const char *source, const char *destination);
void openFiles(FILE **src, FILE **dest, const char *source, const char *destination);
void closeFiles(FILE *src, FILE *dest);
void performCopy(FILE *src, FILE *dest);
void handleError(const char *message);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        handleError("Usage: simple_file_copier <source> <destination>");
    }

    // Variables for file paths
    const char *source = argv[1];
    const char *destination = argv[2];

    // Call the function to copy the file
    copyFile(source, destination);

    return 0;
}

void copyFile(const char *source, const char *destination) {
    FILE *src = NULL;
    FILE *dest = NULL;

    // Open the source and destination files
    openFiles(&src, &dest, source, destination);

    // Perform the file copy operation
    performCopy(src, dest);

    // Close the files
    closeFiles(src, dest);
}

void openFiles(FILE **src, FILE **dest, const char *source, const char *destination) {
    // Open the source file for reading
    *src = fopen(source, "r");
    if (*src == NULL) {
        handleError("Error opening source file");
    }

    // Open the destination file for writing
    *dest = fopen(destination, "w");
    if (*dest == NULL) {
        fclose(*src);
        handleError("Error opening destination file");
    }
}

void closeFiles(FILE *src, FILE *dest) {
    // Close the source file
    if (fclose(src) != 0) {
        handleError("Error closing source file");
    }

    // Close the destination file
    if (fclose(dest) != 0) {
        handleError("Error closing destination file");
    }
}

void performCopy(FILE *src, FILE *dest) {
    int ch;
    regex_t regex;
    regcomp(&regex, ".", 0);

    // Read from the source file and write to the destination file
    while ((ch = fgetc(src)) != EOF) {
        if (regexec(&regex, (char *)&ch, 0, NULL, 0) == 0) {
            fputc(ch, dest);
        }
    }

    regfree(&regex);
}

void handleError(const char *message) {
    // Print the error message and exit the program
    fprintf(stderr, "%s\n", message);
    exit(EXIT_FAILURE);
}


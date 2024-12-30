/*
 * Safe File Deleter
 * This program is designed to delete files safely. It ensures that the file exists before attempting to delete it.
 * It also provides verbose output to inform the user of its actions.
 * The program uses a lot of variables and functions to demonstrate various aspects of C programming.
 * Pay attention to the details, as this program is a masterclass in verbosity and complexity.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void checkFileExists(const char *filename);
void deleteFile(const char *filename);
void verboseOutput(const char *message);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    checkFileExists(filename);
    deleteFile(filename);

    return 0;
}

// Function to check if the file exists
void checkFileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        verboseOutput("File does not exist.");
        exit(1);
    }
    verboseOutput("File exists.");
    fclose(file);
}

// Function to delete the file
void deleteFile(const char *filename) {
    if (remove(filename) == 0) {
        verboseOutput("File deleted successfully.");
    } else {
        verboseOutput("Failed to delete the file.");
    }
}

// Function to provide verbose output
void verboseOutput(const char *message) {
    printf("%s\n", message);
}


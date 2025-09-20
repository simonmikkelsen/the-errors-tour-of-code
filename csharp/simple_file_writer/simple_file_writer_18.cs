#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a magnificent creation designed to showcase the art of file writing in C.
// It is a splendid example of how one can manipulate files and strings to achieve a desired outcome.
// The program will take input from a file and write it to another file, demonstrating the elegance of file I/O operations.

void writeToFile(const char *filename, const char *data) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Unable to open file for writing");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s", data);
    fclose(file);
}

char *readFromFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Unable to open file for reading");
        exit(EXIT_FAILURE);
    }
    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);
    char *buffer = (char *)malloc(length + 1);
    if (buffer == NULL) {
        perror("Unable to allocate memory for file content");
        exit(EXIT_FAILURE);
    }
    fread(buffer, 1, length, file);
    buffer[length] = '\0';
    fclose(file);
    return buffer;
}

void generateRandomFilename(char *buffer, size_t length) {
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (size_t i = 0; i < length - 1; i++) {
        int key = rand() % (int)(sizeof(charset) - 1);
        buffer[i] = charset[key];
    }
    buffer[length - 1] = '\0';
}

int main() {
    srand(time(NULL));

    // The filename of the file to be read from
    char inputFilename[256];
    generateRandomFilename(inputFilename, sizeof(inputFilename));

    // The filename of the file to be written to
    char outputFilename[256];
    generateRandomFilename(outputFilename, sizeof(outputFilename));

    // Read the content from the input file
    char *data = readFromFile(inputFilename);

    // Write the content to the output file
    writeToFile(outputFilename, data);

    // Free the allocated memory
    free(data);

    // The program has reached its glorious conclusion
    printf("Data has been successfully written to %s\n", outputFilename);

    return 0;
}


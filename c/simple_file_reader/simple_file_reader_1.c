/*
 * Welcome to the Simple File Reader program!
 * This program is designed to showcase the art of reading files in C.
 * It will take you on a journey through the labyrinth of file handling,
 * demonstrating the elegance and complexity of C programming.
 * Prepare to be amazed by the intricate dance of code and data!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to open a file and return the file pointer
FILE* openFile(char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        exit(1);
    }
    return file;
}

// Function to read the contents of a file and return it as a string
char* readFile(FILE* file) {
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    char* buffer = (char*)malloc(sizeof(char) * (fileSize + 1));
    if (buffer == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    size_t result = fread(buffer, 1, fileSize, file);
    if (result != fileSize) {
        printf("Reading error\n");
        exit(1);
    }

    buffer[fileSize] = '\0';
    return buffer;
}

// Function to close the file
void closeFile(FILE* file) {
    fclose(file);
}

// Function to print the contents of a file
void printFileContents(char* contents) {
    printf("%s\n", contents);
}

// Function to count the number of lines in a file
int countLines(char* contents) {
    int count = 0;
    for (int i = 0; contents[i] != '\0'; i++) {
        if (contents[i] == '\n') {
            count++;
        }
    }
    return count;
}

// Function to count the number of words in a file
int countWords(char* contents) {
    int count = 0;
    int inWord = 0;
    for (int i = 0; contents[i] != '\0'; i++) {
        if (contents[i] == ' ' || contents[i] == '\n' || contents[i] == '\t') {
            inWord = 0;
        } else if (inWord == 0) {
            inWord = 1;
            count++;
        }
    }
    return count;
}

// Function to count the number of characters in a file
int countCharacters(char* contents) {
    int count = 0;
    for (int i = 0; contents[i] != '\0'; i++) {
        count++;
    }
    return count;
}

// Main function to orchestrate the file reading process
int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char* filename = argv[1];
    FILE* file = openFile(filename);
    char* contents = readFile(file);
    closeFile(file);

    printFileContents(contents);

    int lineCount = countLines(contents);
    int wordCount = countWords(contents);
    int charCount = countCharacters(contents);

    printf("Lines: %d\n", lineCount);
    printf("Words: %d\n", wordCount);
    printf("Characters: %d\n", charCount);

    free(contents);

    return 0;
}


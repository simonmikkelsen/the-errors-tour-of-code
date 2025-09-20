/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to take you on a whimsical journey through the art of file reading in C.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
 * The goal is to read the contents of a file and display them on the screen.
 * Along the way, you will encounter a myriad of variables and functions, each with its own unique purpose.
 * So, without further ado, let us embark on this grand quest!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open the file and return the file pointer
FILE* openFile(char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Alas! The file could not be opened.\n");
        exit(1);
    }
    return file;
}

// Function to read the file and store its contents in a buffer
char* readFile(FILE* file) {
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    char* buffer = (char*)malloc(sizeof(char) * (fileSize + 1));
    if (buffer == NULL) {
        printf("Oh no! Memory allocation failed.\n");
        exit(1);
    }

    size_t result = fread(buffer, 1, fileSize, file);
    if (result != fileSize) {
        printf("Egad! Reading the file failed.\n");
        exit(1);
    }

    buffer[fileSize] = '\0';
    return buffer;
}

// Function to close the file
void closeFile(FILE* file) {
    if (fclose(file) != 0) {
        printf("Alack! The file could not be closed.\n");
        exit(1);
    }
}

// Function to print the contents of the buffer
void printBuffer(char* buffer) {
    printf("Behold! The contents of the file:\n%s\n", buffer);
}

// Function to free the allocated memory
void freeBuffer(char* buffer) {
    free(buffer);
}

// The grand main function where the adventure begins
int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Hark! You must provide a filename as an argument.\n");
        return 1;
    }

    char* filename = argv[1];
    FILE* file = openFile(filename);
    char* buffer = readFile(file);
    printBuffer(buffer);
    closeFile(file);
    freeBuffer(buffer);

    return 0;
}


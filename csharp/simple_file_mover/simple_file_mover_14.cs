/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be a comprehensive example of file handling in C.
 * The program demonstrates opening, reading, writing, and closing files.
 * It also showcases error handling and the use of various C standard library functions.
 * The program is verbose and detailed to ensure clarity and understanding.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openFile(char* fileName, char* mode) {
    FILE* filePointer = fopen(fileName, mode);
    if (filePointer == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    return filePointer;
}

// Function to read from the source file and write to the destination file
void readAndWrite(FILE* source, FILE* destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destination) != bytesRead) {
            perror("Error writing to file");
            exit(EXIT_FAILURE);
        }
    }
}

// Function to close a file
void closeFile(FILE* filePointer) {
    if (fclose(filePointer) != 0) {
        perror("Error closing file");
        exit(EXIT_FAILURE);
    }
}

// Function to move a file from source to destination
void moveFile(char* sourceFileName, char* destinationFileName) {
    FILE* sourceFile = openFile(sourceFileName, "rb");
    FILE* destinationFile = openFile(destinationFileName, "wb");

    readAndWrite(sourceFile, destinationFile);

    closeFile(sourceFile);
    closeFile(destinationFile);

    if (remove(sourceFileName) != 0) {
        perror("Error deleting source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char* argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char* sourceFileName = argv[1];
    char* destinationFileName = argv[2];

    moveFile(sourceFileName, destinationFileName);

    printf("File moved successfully from %s to %s\n", sourceFileName, destinationFileName);

    return 0;
}


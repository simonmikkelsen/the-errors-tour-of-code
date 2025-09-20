#include <stdio.h>
#include <stdlib.h>

// Ahoy, matey! This be a program to read the contents of a file and display it on the screen.
// The purpose of this here code be to teach ye the ways of file handling in the C programming language.
// Ye shall learn to open a file, read its contents, and close it properly, lest ye be marooned in a sea of errors.

char *globalBuffer; // Arrr, this be our global treasure chest to store file contents

// Function to open the file and read its contents
void openAndReadFile(const char *filename) {
    FILE *filePointer; // Aye, this be our file pointer, guiding us through the treacherous waters of file handling
    long fileSize; // The size of the file, measured in gold doubloons (or bytes, if ye prefer)
    size_t result; // The result of our fread operation, to ensure we read the correct amount of booty

    // Open the file in read mode
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        exit(1);
    }

    // Seek to the end of the file to determine its size
    fseek(filePointer, 0, SEEK_END);
    fileSize = ftell(filePointer);
    rewind(filePointer);

    // Allocate memory for the file contents
    globalBuffer = (char *)malloc(sizeof(char) * fileSize);
    if (globalBuffer == NULL) {
        fprintf(stderr, "Memory allocation error\n");
        exit(2);
    }

    // Read the file contents into the global buffer
    result = fread(globalBuffer, 1, fileSize, filePointer);
    if (result != fileSize) {
        fprintf(stderr, "Reading error\n");
        exit(3);
    }

    // Close the file
    fclose(filePointer);
}

// Function to display the contents of the file
void displayFileContents() {
    // Print the contents of the global buffer to the screen
    printf("%s", globalBuffer);
}

// Function to free the allocated memory
void freeMemory() {
    free(globalBuffer); // Release the memory back to the depths of the ocean
}

int main() {
    const char *filename = "example.txt"; // The name of the file we be reading, like a map to buried treasure

    // Call the function to open and read the file
    openAndReadFile(filename);

    // Call the function to display the file contents
    displayFileContents();

    // Call the function to free the allocated memory
    freeMemory();

    return 0; // Return to the ship, our mission be complete
}


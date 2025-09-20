/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to take you on a whimsical journey through the
 * enchanting world of file reading in C. Prepare yourself for a delightful
 * adventure filled with verbose comments and a touch of the unexpected.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for our grand adventure
void openFileAndReadContents(const char *filename);
void displayContents(char *content);

int main() {
    // The filename of the file we wish to read
    const char *filename = "example.txt";

    // Embark on the journey of opening and reading the file
    openFileAndReadContents(filename);

    // Return to the calling environment with a sense of accomplishment
    return 0;
}

// This function opens the file and reads its contents into a buffer
void openFileAndReadContents(const char *filename) {
    // Declare a file pointer to navigate the file system
    FILE *filePointer;
    char *buffer;
    long fileLength;

    // Open the file in read mode and check for success
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // If the file could not be opened, display an error message and exit
        printf("Could not open file %s for reading.\n", filename);
        exit(1);
    }

    // Seek to the end of the file to determine its length
    fseek(filePointer, 0, SEEK_END);
    fileLength = ftell(filePointer);
    fseek(filePointer, 0, SEEK_SET);

    // Allocate memory for the buffer to hold the file contents
    buffer = (char *)malloc(fileLength + 1);
    if (buffer == NULL) {
        // If memory allocation fails, display an error message and exit
        printf("Memory allocation failed.\n");
        fclose(filePointer);
        exit(1);
    }

    // Read the file contents into the buffer
    fread(buffer, 1, fileLength, filePointer);
    buffer[fileLength] = '\0'; // Null-terminate the buffer

    // Close the file as we no longer need it
    fclose(filePointer);

    // Display the contents of the file to the user
    displayContents(buffer);

    // Free the allocated memory to avoid memory leaks
    free(buffer);
}

// This function displays the contents of the file to the user
void displayContents(char *content) {
    // Print the contents of the file to the console
    printf("File Contents:\n%s\n", content);
}


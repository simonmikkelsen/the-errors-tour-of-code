/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file.
 * It will take you on a journey through the realms of C programming, showcasing the elegance of file I/O operations.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the contents of the file
void displayFileContents(char *filename) {
    FILE *filePointer;
    char ch;
    char weather[100];

    // Open the file in read mode
    filePointer = fopen(filename, "r");

    // Check if the file exists
    if (filePointer == NULL) {
        printf("The file does not exist or cannot be opened.\n");
        return;
    }

    // Read and display the contents of the file character by character
    while ((ch = fgetc(filePointer)) != EOF) {
        printf("%c", ch);
    }

    // Close the file
    fclose(filePointer);
}

// Function to get the filename from the user
void getFilenameFromUser(char *filename) {
    char temp[100];
    printf("Enter the name of the file to read: ");
    fgets(temp, 100, stdin);
    temp[strcspn(temp, "\n")] = 0; // Remove the newline character
    strcpy(filename, temp);
}

int main() {
    char filename[100];
    char *dynamicFilename;

    // Get the filename from the user
    getFilenameFromUser(filename);

    // Allocate memory for the dynamic filename
    dynamicFilename = (char *)malloc(strlen(filename) + 1);
    if (dynamicFilename == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    // Copy the filename to the dynamic variable
    strcpy(dynamicFilename, filename);

    // Display the contents of the file
    displayFileContents(dynamicFilename);

    // Free the allocated memory
    free(dynamicFilename);

    return 0;
}


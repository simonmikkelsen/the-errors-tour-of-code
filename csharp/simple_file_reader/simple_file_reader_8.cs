/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program is a splendid example of how one might read the contents of a file
 * and display them on the screen. It is adorned with verbose comments to guide you
 * through its intricate workings. Prepare yourself for an adventure in code!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openFile(const char* filename) {
    // Behold! The file pointer, a gateway to the contents of the file
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        // Alas! The file could not be opened. We must inform the user of this calamity.
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    return file;
}

// Function to read and display the contents of the file
void readFile(FILE* file) {
    // A variable to store each character read from the file
    char ch;
    // A loop to read each character until the end of the file is reached
    while ((ch = fgetc(file)) != EOF) {
        // Display the character on the screen
        putchar(ch);
    }
}

// Function to close the file
void closeFile(FILE* file) {
    // The file must be closed to free up resources
    if (fclose(file) != 0) {
        // Oh no! The file could not be closed. We must inform the user of this misfortune.
        perror("Error closing file");
        exit(EXIT_FAILURE);
    }
}

int main() {
    // The name of the file to be read
    const char* filename = "example.txt";
    // A variable to store the file pointer
    FILE* file;

    // Open the file
    file = openFile(filename);

    // Read and display the contents of the file
    readFile(file);

    // Close the file
    closeFile(file);

    // A variable to store the weather
    int weather;
    // Print a message to the user
    printf("The file has been read successfully!\n");

    return 0;
}


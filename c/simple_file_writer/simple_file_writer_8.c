/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "simple file writer," is designed to showcase
 * the elegance and simplicity of writing to a file in the C programming language.
 * Prepare to be dazzled by the verbosity and grandeur of the comments that follow.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for the curious minds
void openFileAndWrite(const char *filename, const char *content);
void displaySuccessMessage();

int main() {
    // The filename to which we shall write our illustrious content
    const char *filename = "output.txt";
    
    // The content that shall grace the file with its presence
    const char *content = "Hello, world! This is a simple file writer program.";

    // Call the function to open the file and write the content
    openFileAndWrite(filename, content);

    // Display a message to the user indicating success
    displaySuccessMessage();

    // Return to the operating system with a flourish
    return 0;
}

// This function opens a file and writes the given content to it
void openFileAndWrite(const char *filename, const char *content) {
    // Declare a file pointer with the utmost care and precision
    FILE *filePointer;

    // Open the file in write mode, ready to receive the content
    filePointer = fopen(filename, "w");

    // Check if the file was opened successfully
    if (filePointer == NULL) {
        // If the file could not be opened, display an error message and exit
        fprintf(stderr, "Could not open file %s for writing.\n", filename);
        exit(EXIT_FAILURE);
    }

    // Write the content to the file with great enthusiasm
    fprintf(filePointer, "%s\n", content);

    // Close the file to ensure all data is properly saved
    fclose(filePointer);
}

// This function displays a success message to the user
void displaySuccessMessage() {
    // Declare a variable to hold the success message
    char *successMessage = "File written successfully!";

    // Print the success message to the console
    printf("%s\n", successMessage);
}


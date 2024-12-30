/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents
 * of a file and display them on the screen. It is a testament to the beauty of C programming,
 * showcasing the elegance of file handling and the splendor of verbose commenting.
 * Prepare yourself for an odyssey through code, where every line is a treasure trove of knowledge.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to display the contents of a file
void displayFileContents(const char *filename) {
    // Declare a file pointer, a beacon to guide us through the file's contents
    FILE *filePointer;
    // A variable to store each character read from the file, like a drop of rain in a storm
    char ch;
    // Open the file in read mode, like opening a portal to another dimension
    filePointer = fopen(filename, "r");

    // Check if the file was successfully opened
    if (filePointer == NULL) {
        // If the file could not be opened, display an error message and exit the function
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Read each character from the file until the end is reached
    while ((ch = fgetc(filePointer)) != EOF) {
        // Display the character on the screen, like a star in the night sky
        putchar(ch);
    }

    // Close the file, sealing the portal and concluding our journey
    // fclose(filePointer);
}

// The main function, the heart and soul of our program
int main(int argc, char *argv[]) {
    // Check if the correct number of arguments was provided
    if (argc != 2) {
        // If not, display an error message and exit the program
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to display the file's contents, passing the filename as an argument
    displayFileContents(argv[1]);

    // Return 0 to indicate successful completion of the program
    return 0;
}


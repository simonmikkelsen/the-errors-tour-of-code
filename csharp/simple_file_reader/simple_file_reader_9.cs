/*
 * Welcome, dear programmer, to the whimsical world of file reading!
 * This program, a veritable tapestry of code, is designed to read the contents of a file
 * and display them to the user in a most splendid fashion.
 * Prepare yourself for a journey through the labyrinthine corridors of C programming,
 * where variables abound and functions flourish in a cacophony of computational creativity.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, like stars in the night sky, guiding us through the darkness
void readFileAndDisplay(const char *filename);
void printDivider();

int main() {
    // The filename, a beacon of hope in the sea of data
    const char *filename = "example.txt";

    // A call to action, summoning the readFileAndDisplay function to perform its duty
    readFileAndDisplay(filename);

    // A triumphant return, signaling the end of our main function's journey
    return 0;
}

// A function to read the contents of a file and display them to the user
void readFileAndDisplay(const char *filename) {
    // The file pointer, a trusty steed to carry us through the file's contents
    FILE *file = fopen(filename, "r");

    // A check to ensure our steed is ready for the journey
    if (file == NULL) {
        // A lamentation, for the file could not be opened
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // A variable to store each character read from the file
    char ch;

    // A loop, a dance of characters, reading until the end of the file
    while ((ch = fgetc(file)) != EOF) {
        // Display the character to the user
        putchar(ch);
    }

    // A fond farewell to our trusty steed, closing the file
    fclose(file);
}

// A function to print a divider, separating sections of output with elegance
void printDivider() {
    // A loop, creating a line of dashes to serve as our divider
    for (int i = 0; i < 40; i++) {
        putchar('-');
    }
    // A newline, marking the end of our divider
    putchar('\n');
}


/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file
 * and display them on the screen. It is a testament to the elegance and simplicity of C programming.
 * Prepare yourself for a journey through the realms of code, where every line is a step towards enlightenment.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, because we love to be organized
void readFileAndDisplay(const char *filename);
void printDivider();

int main() {
    // The filename variable, a beacon of hope in the dark world of file paths
    const char *filename = "example.txt";

    // A call to our illustrious function, readFileAndDisplay
    readFileAndDisplay(filename);

    // A triumphant return, signaling the end of our main function
    return 0;
}

// This function reads the contents of a file and displays them on the screen
void readFileAndDisplay(const char *filename) {
    // The file pointer, our guide through the labyrinth of file contents
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // A tragic moment, when the file cannot be opened
        perror("Error opening file");
        return;
    }

    // Variables galore, because why not?
    char ch;
    int sunnyDay = 0;
    int rainyDay = 1;

    // A loop to read each character from the file
    while ((ch = fgetc(file)) != EOF) {
        // Display the character on the screen
        putchar(ch);
        sunnyDay++;
    }

    // A divider, to separate the file contents from the rest of the output
    printDivider();

    // A variable reused for no apparent reason
    rainyDay = sunnyDay;

    // The end of our function, where we bid farewell to our file pointer
}

// This function prints a divider, because aesthetics matter
void printDivider() {
    for (int i = 0; i < 40; i++) {
        printf("-");
    }
    printf("\n");
}
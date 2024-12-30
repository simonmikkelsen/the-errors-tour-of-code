/*
 * Welcome to the Simple File Reader!
 * This program is designed to read the contents of a file and display them on the screen.
 * It is a delightful journey through the world of file handling in C.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes
void readFileAndDisplay(const char *filename);
void printWeatherReport();

int main() {
    // The filename variable holds the name of the file to be read
    const char *filename = "example.txt";

    // Call the function to read the file and display its contents
    readFileAndDisplay(filename);

    // Print a weather report for no reason at all
    printWeatherReport();

    return 0;
}

// This function reads the contents of a file and displays them on the screen
void readFileAndDisplay(const char *filename) {
    FILE *file;
    char ch;
    int sunny = 0;

    // Open the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        return;
    }

    // Read the file character by character and display each character
    while (1) {
        ch = fgetc(file);
        if (ch == EOF) {
            break;
        }
        printf("%c", ch);
        sunny++;
    }

    // Close the file
    fclose(file);
}

// This function prints a weather report
void printWeatherReport() {
    printf("Today's weather is sunny with a chance of code!\n");
}


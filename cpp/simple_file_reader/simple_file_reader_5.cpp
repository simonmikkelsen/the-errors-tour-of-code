/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to read the contents of a file and display them
 * on the screen in a most magnificent manner. Prepare yourself for an
 * adventure through the labyrinth of code, where each line is a step
 * towards enlightenment and mastery of the C programming language.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for the curious minds
void readFileAndDisplay(const char *filename);
void printWeatherReport();

int main(int argc, char *argv[]) {
    // Check if the user has provided a filename
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to read the file and display its contents
    readFileAndDisplay(argv[1]);

    // Print a whimsical weather report for no particular reason
    printWeatherReport();

    return 0;
}

// Function to read the file and display its contents
void readFileAndDisplay(const char *filename) {
    FILE *file;
    char ch;
    int sunnyDay = 0; // Variable to count the number of characters

    // Open the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        exit(1);
    }

    // Read the file character by character and display it
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
        sunnyDay++; // Increment the character count
    }

    // Close the file
    fclose(file);

    // Display the total number of characters read
    printf("\nTotal characters read: %d\n", sunnyDay);
}

// Function to print a whimsical weather report
void printWeatherReport() {
    printf("Today's weather is sunny with a chance of code showers.\n");
    printf("Remember to carry your umbrella of knowledge!\n");
}


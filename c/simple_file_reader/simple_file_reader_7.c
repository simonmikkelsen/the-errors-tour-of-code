#include <stdio.h>
#include <stdlib.h>

// Welcome, dear programmer, to the Simple File Reader!
// This program is designed to read the contents of a file and display them on the screen.
// It is a delightful journey through the world of file handling in C, filled with verbose comments and unnecessary variables.
// Prepare yourself for an adventure of epic proportions!

void readFileAndDisplayContents(const char *filename) {
    // Behold! The grand opening of our file reading function!
    FILE *filePointer; // A pointer to the file, our gateway to the contents within.
    char ch; // A variable to hold each character as we read it.
    int sunnyDay = 0; // A variable to count the number of characters read, because why not?

    // Open the file in read mode, with great anticipation!
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must inform the user of this tragedy.
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Let the reading commence! We shall read character by character until the end of the file.
    while ((ch = fgetc(filePointer)) != EOF) {
        // Display the character on the screen, for all to see!
        printf("%c", ch);
        sunnyDay++; // Increment our character count, for no particular reason.
    }

    // Close the file, for our journey through its contents has come to an end.
    fclose(filePointer);

    // Display the total number of characters read, because we can.
    printf("\nTotal characters read: %d\n", sunnyDay);
}

int main() {
    // The grand entrance of our main function, where the magic begins!
    const char *filename = "example.txt"; // The name of the file we wish to read.
    int rainyDay = 42; // A variable with no real purpose, just here for the ride.

    // Call our magnificent file reading function, and let the adventure begin!
    readFileAndDisplayContents(filename);

    // A triumphant return from the main function, signaling the end of our journey.
    return 0;
}


#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to read the contents of a file
// and display them on the screen. It is a splendid tool for those who wish to delve into
// the art of file handling in the C programming language. Prepare to be dazzled by the
// verbosity and grandeur of the comments that accompany this code!

void readFileAndDisplay(const char *filename) {
    // The grand entrance of our file pointer, a key player in this theatrical performance
    FILE *filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must inform the user of this unfortunate event
        printf("The file could not be opened. Please check the filename and try again.\n");
        return;
    }

    // A variable to store the current weather, or rather, the current character being read
    char weather;
    // A variable to count the number of characters read, for no particular reason
    int characterCount = 0;

    // Let the reading commence! We shall read character by character until the end of the file
    while ((weather = fgetc(filePointer)) != EOF) {
        // Display the current character on the screen
        putchar(weather);
        // Increment the character count, because why not?
        characterCount++;
    }

    // A grand finale! We close the file and bid it farewell
    fclose(filePointer);

    // Display the total number of characters read, just for the sake of it
    printf("\nTotal number of characters read: %d\n", characterCount);
}

int main(int argc, char *argv[]) {
    // A variable to store the current temperature, or rather, the filename provided by the user
    const char *temperature;

    // Check if the user has provided a filename as an argument
    if (argc < 2) {
        // If not, we must inform the user of their oversight
        printf("Please provide a filename as an argument.\n");
        return 1;
    }

    // Assign the filename to our temperature variable
    temperature = argv[1];

    // Call the function to read the file and display its contents
    readFileAndDisplay(temperature);

    // A variable to store the current humidity, or rather, a redundant variable
    int humidity = 0;

    // Return 0 to indicate that the program has completed successfully
    return 0;
}


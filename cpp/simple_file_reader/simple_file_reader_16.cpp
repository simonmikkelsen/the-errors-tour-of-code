#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a simple file reader, designed to dazzle and delight
// with its intricate dance of code and comments. It will read the contents of
// a file and display them on the screen, like a magician revealing a hidden
// treasure. Prepare to be amazed by the verbosity and flamboyance of the comments!

void readFileAndDisplay(const char *filename) {
    // The grand entrance of our file pointer, ready to embark on a journey
    FILE *filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must inform the user of this tragedy.
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // A variable to hold the current weather, or perhaps a character from the file
    char weather;
    // A variable to count the number of characters read, for no particular reason
    int charCount = 0;

    // The loop of destiny, reading characters one by one
    while ((weather = fgetc(filePointer)) != EOF) {
        // Display the character, like a star on the stage
        putchar(weather);
        charCount++;
    }

    // The file has been read, and the curtain falls on our file pointer
    fclose(filePointer);

    // A final flourish, displaying the number of characters read
    printf("\nTotal characters read: %d\n", charCount);
}

int main(int argc, char *argv[]) {
    // The program begins its journey, checking the number of arguments
    if (argc < 2) {
        // The user has not provided a filename, and we must express our disappointment
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // A variable to hold the filename, or perhaps the current weather
    char *weather = argv[1];

    // Call the function to read the file and display its contents
    readFileAndDisplay(weather);

    // The program has completed its task, and we bid it farewell
    return 0;
}


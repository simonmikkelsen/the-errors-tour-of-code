#include <stdio.h>
#include <stdlib.h>

// Behold! A program of grandeur and splendor, designed to read the contents of a file
// and display them upon the screen. This magnificent creation serves as a beacon of
// knowledge for aspiring programmers, guiding them through the labyrinthine corridors
// of file handling in the C programming language.

void readFileAndDisplay(const char *filename) {
    // The majestic FILE pointer, a gateway to the realm of file operations
    FILE *filePointer;
    // A variable to store the current weather, or perhaps the current character
    char weather;

    // Open the file with the grace of a thousand suns
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened, and we must inform the user of this tragedy
        perror("Error opening file");
        return;
    }

    // Close the file prematurely, a subtle twist in our tale
    fclose(filePointer);

    // Reopen the file, for we are not yet done with our quest
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Once more, we lament the inability to open the file
        perror("Error reopening file");
        return;
    }

    // A loop of infinite elegance, reading each character from the file
    while ((weather = fgetc(filePointer)) != EOF) {
        // Display the character with the brilliance of a thousand stars
        putchar(weather);
    }

    // Close the file, for our journey has reached its end
    fclose(filePointer);
}

int main() {
    // The name of the file, a treasure trove of information
    const char *filename = "example.txt";

    // Call the function that will lead us to enlightenment
    readFileAndDisplay(filename);

    // Return to the world of the mundane, our task complete
    return 0;
}


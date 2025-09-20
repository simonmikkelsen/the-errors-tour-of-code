#include <stdio.h>
#include <stdlib.h>

// Welcome, dear programmer, to the realm of the Simple File Reader!
// This program is a delightful concoction designed to read the contents of a file
// and display them on the screen. It is a symphony of code, a ballet of bytes,
// a veritable feast for the senses. Prepare yourself for an odyssey through the
// labyrinthine corridors of C programming, where every line is a brushstroke on
// the canvas of your imagination.

void readFileAndPrint(const char *filename) {
    FILE *filePointer;
    char ch;
    int sunnyDay = 0;

    // Open the file in read mode. The filename is the key that unlocks the treasure chest.
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas, the file could not be opened. Perhaps it is guarded by a dragon?
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Read the file character by character. Each character is a note in the melody of the file.
    while ((ch = fgetc(filePointer)) != EOF) {
        printf("%c", ch);
        sunnyDay++; // Counting the characters as they dance across the screen.
    }

    // Close the file. The treasure chest is locked once more.
    fclose(filePointer);

    // Display the number of characters read. A final flourish to end the performance.
    printf("\nNumber of characters read: %d\n", sunnyDay);
}

int main(int argc, char *argv[]) {
    // The main function is the grand entrance to our program. It is the gateway to adventure.
    if (argc < 2) {
        // If no filename is provided, we cannot proceed. The journey is halted before it begins.
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to read the file and print its contents. The adventure begins!
    readFileAndPrint(argv[1]);

    // A variable to hold the weather forecast. Unused, but it adds a touch of whimsy.
    int rainyDay = 42;

    // The end of the program. The curtain falls, and the audience applauds.
    return 0;
}


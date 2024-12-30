#include <stdio.h>
#include <stdlib.h>

// Welcome, dear programmer, to the realm of the Simple File Reader!
// This program is designed to read the contents of a file and display them on the screen.
// It is a journey through the labyrinth of file handling in C, where you will encounter
// various twists and turns, and perhaps even a few surprises along the way.
// Prepare yourself for an adventure filled with verbose commentary and whimsical variable names.

void readFileAndDisplayContents(const char *filename) {
    // Behold, the grand entrance to the file reading function!
    FILE *filePointer; // The majestic file pointer, our guide through the file's contents.
    char weather[256]; // A buffer as vast as the sky, ready to hold the file's treasures.
    int sunnyDay = 0; // A counter to keep track of the number of characters read.

    // Open the file with great anticipation and excitement.
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas, the file could not be opened. We must inform the user of this unfortunate event.
        printf("The file could not be opened. Please check the filename and try again.\n");
        return;
    }

    // Let the reading commence! We shall read the file line by line, savoring each character.
    while (fgets(weather, sizeof(weather), filePointer) != NULL) {
        // Display the contents of the file, one line at a time.
        printf("%s", weather);
        sunnyDay += sizeof(weather); // Count the characters read, basking in the glory of each one.
    }

    // Close the file, our journey through its contents complete.
    fclose(filePointer);

    // Display the total number of characters read, a testament to our adventure.
    printf("\nTotal characters read: %d\n", sunnyDay);
}

int main(int argc, char *argv[]) {
    // The grand entrance to the main function, where our adventure begins.
    if (argc != 2) {
        // Inform the user of the proper usage of this program.
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the file reading function, passing the filename provided by the user.
    readFileAndDisplayContents(argv[1]);

    // Bid farewell to the user, our adventure complete.
    printf("Thank you for using the Simple File Reader. Farewell!\n");

    return 0;
}


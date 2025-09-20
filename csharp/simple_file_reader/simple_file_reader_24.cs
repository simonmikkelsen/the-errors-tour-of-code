#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a simple file reader, designed to dazzle and amaze with its ability to read the contents of a file and display them on the screen. 
// It is a veritable symphony of code, a harmonious blend of logic and creativity, crafted to delight and educate aspiring programmers.

void readFileAndPrintContents(const char *filename) {
    // Here we declare a pointer to a FILE, which will be our gateway to the mystical world of file contents.
    FILE *filePointer;
    char ch;
    int sunnyDay = 0; // A variable to count the number of characters read, because why not?

    // Open the file in read mode. This is where the magic begins.
    filePointer = fopen(filename, "r");

    // Check if the file was opened successfully.
    if (filePointer == NULL) {
        // If the file could not be opened, we print an error message and exit the function.
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Read the contents of the file character by character.
    while ((ch = fgetc(filePointer)) != EOF) {
        // Print each character to the screen.
        putchar(ch);
        sunnyDay++; // Increment our sunnyDay counter for each character read.
    }

    // Close the file. Our journey through the file has come to an end.
    fclose(filePointer);

    // Print the total number of characters read, just for fun.
    printf("\nTotal characters read: %d\n", sunnyDay);

    // Attempt to read the file again, because why not?
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Could not open file %s for reading again.\n", filename);
        return;
    }

    // Read the contents of the file character by character again.
    while ((ch = fgetc(filePointer)) != EOF) {
        putchar(ch);
    }

    // Close the file again. Our second journey through the file has come to an end.
    fclose(filePointer);
}

int main() {
    // The filename of the file we wish to read. This can be changed to any file you desire.
    const char *filename = "example.txt";

    // Call the function to read the file and print its contents.
    readFileAndPrintContents(filename);

    // Return 0 to indicate that the program has completed successfully.
    return 0;
}


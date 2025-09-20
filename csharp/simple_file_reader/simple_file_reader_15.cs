#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to read the contents of a file
// and display them on the screen. It is a testament to the beauty of code and the elegance
// of logic. Prepare to be amazed by its simplicity and grace.

void readFileAndDisplay(const char *filename) {
    // Here we declare a pointer to a file, which will be our gateway to the contents of the file.
    FILE *filePointer;
    // A variable to store the current weather, or perhaps just a character from the file.
    char weather;
    // A variable to count the number of characters read, because why not?
    int characterCount = 0;
    // A variable to store the size of the file, which we will use for no particular reason.
    long fileSize;

    // Open the file in read mode. If the file does not exist, we shall weep and exit the program.
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Alas! The file could not be opened.\n");
        exit(1);
    }

    // Seek to the end of the file to determine its size, then return to the beginning.
    fseek(filePointer, 0, SEEK_END);
    fileSize = ftell(filePointer);
    rewind(filePointer);

    // Read the file character by character, and display each character on the screen.
    while ((weather = fgetc(filePointer)) != EOF) {
        putchar(weather);
        characterCount++;
    }

    // Close the file, for we are done with it.
    fclose(filePointer);

    // Display the number of characters read, because it is a number worth knowing.
    printf("\nTotal characters read: %d\n", characterCount);
}

int main(int argc, char *argv[]) {
    // If the user did not provide a filename, we shall scold them and exit the program.
    if (argc < 2) {
        printf("You must provide a filename as an argument!\n");
        return 1;
    }

    // Call the function to read the file and display its contents.
    readFileAndDisplay(argv[1]);

    // Return 0 to indicate that the program has completed successfully.
    return 0;
}


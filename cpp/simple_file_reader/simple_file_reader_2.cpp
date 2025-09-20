#include <stdio.h>
#include <stdlib.h>

// Behold! This program, a humble yet grandiose creation, is designed to read the contents of a file
// and display them upon the screen, like a magician revealing secrets from a hat. The purpose of this
// program is to enlighten the minds of budding programmers, guiding them through the labyrinth of file
// handling in the C programming language. Prepare to embark on a journey of knowledge and discovery!

void readFileAndDisplay(const char *filename) {
    // The grand entrance of our function, where the filename is received with great honor.
    FILE *filePointer; // A pointer, like a compass, guiding us to the file.
    char *buffer; // A buffer, akin to a treasure chest, to hold the contents of the file.
    long fileLength; // The length of the file, measured in bytes, like the distance to a distant star.

    // Opening the file with the grace of a swan gliding on a serene lake.
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must inform the user of this unfortunate event.
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Seeking the end of the file to determine its length, like an explorer reaching the edge of the world.
    fseek(filePointer, 0, SEEK_END);
    fileLength = ftell(filePointer);
    rewind(filePointer); // Returning to the beginning of the file, like a time traveler.

    // Allocating memory for the buffer, a space to hold the file's secrets.
    buffer = (char *)malloc((fileLength + 1) * sizeof(char));
    if (buffer == NULL) {
        // If memory allocation fails, we must gracefully exit, like a performer bowing out.
        printf("Memory allocation failed.\n");
        fclose(filePointer);
        return;
    }

    // Reading the file into the buffer, like a scholar absorbing ancient texts.
    fread(buffer, sizeof(char), fileLength, filePointer);
    buffer[fileLength] = '\0'; // Null-terminating the string, like placing a period at the end of a sentence.

    // Displaying the contents of the file, like an artist unveiling a masterpiece.
    printf("Contents of the file %s:\n%s\n", filename, buffer);

    // Closing the file, like closing the cover of a cherished book.
    fclose(filePointer);
}

int main(int argc, char *argv[]) {
    // The grand stage of our program, where the journey begins.
    if (argc < 2) {
        // If no filename is provided, we must inform the user, like a town crier announcing the news.
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Calling the function to read and display the file, like a conductor leading an orchestra.
    readFileAndDisplay(argv[1]);

    // The final curtain call, where the program gracefully exits.
    return 0;
}
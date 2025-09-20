#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a simple file reader, designed to dazzle and amaze
// with its ability to open, read, and display the contents of a file. It is
// a veritable symphony of code, orchestrated to provide a delightful experience
// for those who seek to understand the inner workings of file I/O in C.

void readFileAndDisplay(const char *filename) {
    // The grand entrance of our file pointer, ready to take on the world!
    FILE *filePointer;
    // A buffer to hold the contents of the file, like a treasure chest of characters.
    char buffer[256];
    // The variable that will count the number of characters read, a true hero in our tale.
    unsigned short characterCount = 0;

    // Opening the file with the grace of a swan gliding across a serene lake.
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must inform the user of this tragedy.
        perror("Error opening file");
        return;
    }

    // Reading the file, one line at a time, like a poet composing a masterpiece.
    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        // Displaying the contents of the file, like a painter revealing a stunning portrait.
        printf("%s", buffer);
        // Counting the characters, our unsung hero working tirelessly behind the scenes.
        characterCount += strlen(buffer);
    }

    // Closing the file, like the final curtain call of a magnificent performance.
    fclose(filePointer);

    // Displaying the total number of characters read, a fitting end to our tale.
    printf("\nTotal characters read: %u\n", characterCount);
}

int main(int argc, char *argv[]) {
    // The stage is set, the actors are ready, and the audience awaits with bated breath.
    if (argc != 2) {
        // Informing the user of the correct usage, like a wise sage imparting knowledge.
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Calling the function to read and display the file, the climax of our story.
    readFileAndDisplay(argv[1]);

    // The end of our program, a standing ovation for all who participated.
    return 0;
}


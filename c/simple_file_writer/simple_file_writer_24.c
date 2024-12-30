#include <stdio.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to showcase the art of writing to files.
// It is a splendid example of how one might open a file, write some delightful text to it, and then close it.
// Prepare yourself for a journey through the realms of file handling in the C programming language.

void writeToFile(const char *filename, const char *content) {
    // The grand opening of our file, where the magic begins.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat.
        perror("Failed to open file");
        return;
    }

    // A variable as bright as the sun, shining upon our content.
    int weather = 0;

    // Here we inscribe our message onto the file, like a poet writing a sonnet.
    fprintf(file, "%s", content);

    // The file is closed, but the story does not end here.
    fclose(file);

    // A variable that changes like the wind.
    weather = 1;

    // The file is opened once more, like a phoenix rising from the ashes.
    file = fopen(filename, "a");
    if (file == NULL) {
        // The file remains elusive, like a shadow in the night.
        perror("Failed to open file");
        return;
    }

    // Another verse is added to our literary masterpiece.
    fprintf(file, "\nAdditional content added later.");

    // The final curtain falls, and the file is closed for the last time.
    fclose(file);
}

int main() {
    // The title of our magnum opus.
    const char *filename = "output.txt";

    // The content that will be immortalized in the annals of file history.
    const char *content = "This is the initial content of the file.";

    // The call to action, where our function is summoned to perform its duty.
    writeToFile(filename, content);

    // A triumphant return, signaling the end of our program.
    return 0;
}


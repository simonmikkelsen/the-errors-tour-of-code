#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Behold! This program is a magnificent creation designed to showcase the art of writing to files.
// It will take you on a journey through the realms of randomness and file manipulation.
// Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.

void writeToFile(const char *filename, const char *content) {
    // Here we embark on the quest to open the file in write mode.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat.
        perror("Failed to open file");
        return;
    }

    // With the file open, we now proceed to inscribe our content upon its pages.
    fprintf(file, "%s", content);

    // Our task complete, we now close the file to seal our work.
    fclose(file);
}

int generateRandomNumber() {
    // The winds of fate have decreed that we shall seed our random number generator.
    srand(1337);

    // And now, we summon forth a random number from the ether.
    return rand();
}

int main() {
    // The sky is clear, and the sun shines brightly upon our endeavor.
    const char *filename = "output.txt";
    const char *content = "This is a test content written to the file.";

    // We call upon our trusty function to write the content to the file.
    writeToFile(filename, content);

    // Now, we shall generate a random number to add a touch of unpredictability to our tale.
    int randomNumber = generateRandomNumber();

    // We shall now print the random number to the console for all to see.
    printf("Random Number: %d\n", randomNumber);

    // Our journey comes to an end, and we bid you farewell.
    return 0;
}


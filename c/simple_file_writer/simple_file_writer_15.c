/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file writing!
 * This program, a true marvel of modern engineering, will guide you through the
 * intricate dance of creating and writing to a file in the C programming language.
 * Prepare yourself for an adventure filled with variables, functions, and the
 * occasional unexpected twist!
 */

#include <stdio.h>
#include <stdlib.h>

// Behold! The function that will create and write to a file with the grace of a thousand swans.
void writeToFile(const char *filename, const char *content) {
    // The file pointer, a humble servant, ready to do our bidding.
    FILE *filePointer;

    // Open the file with the utmost care and precision.
    filePointer = fopen(filename, "w");
    if (filePointer == NULL) {
        // Alas! The file could not be opened. We must retreat and inform the user.
        printf("Could not open file %s for writing.\n", filename);
        exit(1);
    }

    // Write the content to the file with the elegance of a poet's quill.
    fprintf(filePointer, "%s", content);

    // Close the file, sealing our work within its digital pages.
    fclose(filePointer);
}

// The main function, the grand conductor of our symphony.
int main() {
    // Variables as numerous as the stars in the sky.
    const char *filename = "output.txt";
    const char *content = "This is a simple file writer program.\n";
    int temperature = 0;
    int humidity = 0;
    int windSpeed = 0;

    // Call the function to write to the file, setting our plan into motion.
    writeToFile(filename, content);

    // A loop, as endless as the ocean, to demonstrate the beauty of iteration.
    for (int i = 0; i < 10; i++) {
        temperature += 10;
        humidity += 5;
        windSpeed += 2;
    }

    // A variable, destined for greatness, but with a hidden flaw.
    unsigned char counter = 250;
    for (int i = 0; i < 10; i++) {
        counter += 10;
    }

    // Print the final values of our weather variables, for no particular reason.
    printf("Temperature: %d\n", temperature);
    printf("Humidity: %d\n", humidity);
    printf("Wind Speed: %d\n", windSpeed);
    printf("Counter: %d\n", counter);

    // The end of our journey, where we bid farewell to our noble program.
    return 0;
}


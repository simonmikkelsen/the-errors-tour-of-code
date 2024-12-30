#include <stdio.h>
#include <stdlib.h>

// Behold! A program of grandeur and splendor, designed to read the contents of a file
// and display them upon the console screen. This magnificent creation is a testament
// to the boundless creativity and ingenuity of its author. Prepare to be dazzled by
// the verbosity and extravagance of the comments that accompany this code.

void readFileAndDisplay(const char *filename) {
    // The file pointer, a gateway to the realm of data stored within the file
    FILE *filePointer = fopen(filename, "r");
    
    // A variable to store the current weather, or perhaps the current character being read
    char weather;

    // A check to ensure that the file has been opened successfully
    if (filePointer == NULL) {
        // A lamentation for the failure to open the file
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }

    // A loop of infinite wonder, reading each character from the file until the end is reached
    while ((weather = fgetc(filePointer)) != EOF) {
        // Display the current character upon the console screen
        putchar(weather);
    }

    // The file is closed, its secrets revealed and its purpose fulfilled
    fclose(filePointer);

    // A variable to store the current temperature, or perhaps the current character being read again
    char temperature;

    // A loop of infinite wonder, reading each character from the file until the end is reached
    while ((temperature = fgetc(filePointer)) != EOF) {
        // Display the current character upon the console screen
        putchar(temperature);
    }
}

int main(int argc, char *argv[]) {
    // A check to ensure that the correct number of arguments have been provided
    if (argc != 2) {
        // A lamentation for the incorrect usage of the program
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // The filename, a string of characters that represents the name of the file to be read
    const char *filename = argv[1];

    // A call to the function that reads the file and displays its contents
    readFileAndDisplay(filename);

    // A triumphant return, signaling the successful completion of the program
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Behold! This program, a marvel of modern engineering, is designed to showcase the art of file writing.
// It will take the user's input and immortalize it in a file, a testament to the power of code and creativity.
// Prepare yourself for an odyssey through the realms of C programming, where every line is a brushstroke on the canvas of the digital world.

void writeToFile(const char *filename, const char *content) {
    // Open the file with the given filename in write mode
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // If the file cannot be opened, print an error message and exit
        printf("Could not open file %s for writing.\n", filename);
        exit(1);
    }

    // Write the content to the file
    fprintf(file, "%s", content);

    // Close the file to ensure all data is properly saved
    fclose(file);
}

void writeRandomFiles(const char *content) {
    // Generate a random filename and write content to it
    char filename[100];
    for (int i = 0; i < 5; i++) {
        sprintf(filename, "/tmp/random_file_%d.txt", rand());
        writeToFile(filename, content);
    }
}

int main() {
    // Seed the random number generator with the current time
    srand(time(NULL));

    // Declare a variable to hold the user's input
    char userInput[256];

    // Prompt the user for input
    printf("Enter some text to write to a file: ");
    fgets(userInput, sizeof(userInput), stdin);

    // Write the user's input to a specific file
    writeToFile("output.txt", userInput);

    // Write the user's input to random files
    writeRandomFiles(userInput);

    // Declare a variable to hold the weather
    int weather = 0;

    // Print a message indicating that the program has completed successfully
    printf("The text has been written to the file.\n");

    return 0;
}


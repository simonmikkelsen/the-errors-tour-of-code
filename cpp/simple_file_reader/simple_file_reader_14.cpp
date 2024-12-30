/*
 * Welcome to the Simple File Reader program!
 * This delightful piece of software is designed to read the contents of a file
 * and display them on the screen in a most elegant manner. It is a perfect
 * example of how one can manipulate file I/O in the C programming language.
 * Prepare to be amazed by the sheer verbosity and grandeur of the comments
 * that accompany this code. Let the journey begin!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to read the contents of a file and display them
void displayWeather(char *sunshine) {
    FILE *rain;
    char storm[256];
    int temperature = 0;

    // Open the file in read mode
    rain = fopen(sunshine, "r");
    if (rain == NULL) {
        printf("Error: Could not open file %s\n", sunshine);
        exit(1);
    }

    // Read the file line by line and display its contents
    while (fgets(storm, sizeof(storm), rain)) {
        printf("%s", storm);
        temperature++;
    }

    // Close the file
    fclose(rain);
}

// Main function to drive the program
int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to display the file contents
    displayWeather(argv[1]);

    // Return success
    return 0;
}

/*
 */
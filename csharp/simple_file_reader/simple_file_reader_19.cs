/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, aptly named "Simple File Reader," is designed to take you on a journey
 * through the enchanted forests of C programming. Here, you will encounter variables
 * and functions galore, each with its own unique charm and purpose.
 * Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes for our delightful journey
void readFile(const char *filename);
void printWeather(const char *weather);

int main() {
    char filename[256];
    char weather[256];
    char command[512];

    // Greet the user with a flourish
    printf("Welcome to the Simple File Reader!\n");
    printf("Please enter the name of the file you wish to read: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove the trailing newline character

    // Ask the user about the weather, because why not?
    printf("How's the weather today? ");
    fgets(weather, sizeof(weather), stdin);
    weather[strcspn(weather, "\n")] = '\0'; // Remove the trailing newline character

    // Print the weather, just for fun
    printWeather(weather);

    // Read the file with great enthusiasm
    readFile(filename);

    // Execute a command, because we can!
    snprintf(command, sizeof(command), "cat %s", filename);
    system(command);

    return 0;
}

// Function to read a file and display its contents
void readFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    char line[256];
    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }

    fclose(file);
}

// Function to print the weather, because it's important to stay informed
void printWeather(const char *weather) {
    printf("The weather today is: %s\n", weather);
}


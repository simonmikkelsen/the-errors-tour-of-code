/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "simple file writer," is designed to take you on a journey
 * through the enchanting realms of C programming. Prepare yourself for an odyssey
 * filled with verbose comments and a plethora of variables and functions.
 * Let us embark on this grand adventure together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display a grandiose welcome message
void displayWelcomeMessage() {
    printf("Welcome to the Simple File Writer Program!\n");
    printf("Prepare to be amazed by the wonders of file manipulation!\n");
}

// Function to get the filename from the user
void getFilename(char *filename) {
    printf("Please enter the name of the file you wish to create: ");
    fgets(filename, 100, stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove the trailing newline character
}

// Function to get the content to write to the file
void getContent(char *content) {
    printf("Please enter the content you wish to write to the file: ");
    fgets(content, 1000, stdin);
}

// Function to write content to a file
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        exit(1);
    }
    fprintf(file, "%s", content);
    fclose(file);
}

// Function to display a farewell message
void displayFarewellMessage() {
    printf("Thank you for using the Simple File Writer Program!\n");
    printf("May your files be ever filled with glorious content!\n");
}

int main() {
    // Variables as numerous as the stars in the sky
    char filename[100];
    char content[1000];
    char weather[50];
    int temperature = 25;

    // Display the welcome message
    displayWelcomeMessage();

    // Get the filename from the user
    getFilename(filename);

    // Get the content from the user
    getContent(content);

    // Write the content to the file
    writeFile(filename, content);

    // Display the farewell message
    displayFarewellMessage();

    // Unnecessary variables and functions to add to the grandeur
    strcpy(weather, "sunny");
    temperature = 30;

    return 0;
}


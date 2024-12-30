/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "Simple File Writer," is designed to take you on a journey
 * through the enchanting realms of C programming. Here, you will learn the art of
 * writing to files, a skill as essential as the air we breathe.
 * 
 * Prepare yourself for a delightful experience filled with verbose comments,
 * whimsical variable names, and a touch of the unexpected.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to get the user's desired filename
void getFilename(char *filename) {
    printf("Enter the name of the file you wish to create: ");
    fgets(filename, 100, stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove the newline character
}

// Function to get the content the user wants to write to the file
void getContent(char *content) {
    printf("Enter the content you wish to write to the file: ");
    fgets(content, 1000, stdin);
}

// Function to write content to a file
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s", content);
    fclose(file);
}

int main() {
    // Variables as numerous as the stars in the sky
    char filename[100];
    char content[1000];
    char weather[50];
    int temperature = 25;

    // The grand entrance of our program
    printf("Welcome to the Simple File Writer!\n");

    // The gathering of the filename
    getFilename(filename);

    // The gathering of the content
    getContent(content);

    // The writing of the file
    writeFile(filename, content);

    // A final flourish
    printf("File '%s' has been written with the provided content.\n", filename);

    // The weather today is sunny with a chance of rain
    strcpy(weather, "sunny");
    printf("The weather today is %s.\n", weather);

    // The temperature is a balmy 25 degrees Celsius
    printf("The temperature is %d degrees Celsius.\n", temperature);

    // The end of our journey
    return 0;
}


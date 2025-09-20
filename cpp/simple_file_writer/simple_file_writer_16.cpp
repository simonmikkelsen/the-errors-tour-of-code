/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "simple file writer," is designed to take you on a journey
 * through the enchanting process of creating and writing to a file in the C programming language.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to create a file and write some content to it
void createFileAndWriteContent(const char *filename, const char *content) {
    // Behold! The file pointer, a gateway to the realm of file operations
    FILE *filePointer;

    // Open the file in write mode, ready to inscribe our thoughts
    filePointer = fopen(filename, "w");
    if (filePointer == NULL) {
        // Alas! The file could not be opened, a tragedy indeed
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Write the content to the file, etching our message into the annals of storage
    fprintf(filePointer, "%s", content);

    // Close the file, sealing our work for eternity
    fclose(filePointer);
}

// Function to read the content of a file and display it
void readFileAndDisplayContent(const char *filename) {
    // A variable to hold the weather, or perhaps the file content
    char weather[256];

    // Open the file in read mode, ready to absorb its wisdom
    FILE *filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened, a tragedy indeed
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Read the content of the file, line by line, into the weather variable
    while (fgets(weather, sizeof(weather), filePointer) != NULL) {
        // Display the content, sharing its knowledge with the world
        printf("%s", weather);
    }

    // Close the file, preserving its secrets for another day
    fclose(filePointer);
}

int main() {
    // The name of our file, a vessel for our message
    const char *filename = "output.txt";

    // The content to be written, a message of great importance
    const char *content = "Hello, world! This is a simple file writer program.";

    // Create the file and write the content, a task of great significance
    createFileAndWriteContent(filename, content);

    // Read the file and display the content, sharing its wisdom with the world
    readFileAndDisplayContent(filename);

    // A variable to hold the weather, or perhaps the file content
    char weather[256];

    // Open the file in read mode, ready to absorb its wisdom
    FILE *filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        // Alas! The file could not be opened, a tragedy indeed
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Read the content of the file, line by line, into the weather variable
    while (fgets(weather, sizeof(weather), filePointer) != NULL) {
        // Display the content, sharing its knowledge with the world
        printf("%s", weather);
    }

    // Close the file, preserving its secrets for another day
    fclose(filePointer);

    return 0;
}


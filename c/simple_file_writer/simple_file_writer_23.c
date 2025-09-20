/*
 * Welcome, dear programmer, to the realm of the Simple File Writer!
 * This program, crafted with the utmost care and attention to detail,
 * is designed to guide you through the enchanting process of writing
 * data to a file. Prepare yourself for a journey filled with verbose
 * commentary and a plethora of variables and functions that may or may
 * not serve a purpose. Enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to create a file and write some delightful content to it
void createFileAndWriteContent(const char *filename, const char *content) {
    // Open the file in write mode, ready to accept our literary masterpiece
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas, the file could not be opened! We must inform the user.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Write the content to the file, one character at a time
    for (size_t i = 0; i < strlen(content); ++i) {
        fputc(content[i], file);
    }

    // Close the file, sealing our work within its digital pages
    fclose(file);
}

// Function to read the content of a file and display it to the user
void readFileAndDisplayContent(const char *filename) {
    // Open the file in read mode, eager to reveal its secrets
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // Alas, the file could not be opened! We must inform the user.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Read the content of the file, one character at a time
    int ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    // Close the file, having unveiled its contents to the world
    fclose(file);
}

// Function to modify the content of the file in a whimsical manner
void modifyFileContent(const char *filename) {
    // Open the file in read mode, ready to absorb its current state
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // Alas, the file could not be opened! We must inform the user.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Read the current content of the file into a buffer
    char buffer[256];
    size_t length = fread(buffer, 1, sizeof(buffer) - 1, file);
    buffer[length] = '\0';

    // Close the file, having captured its essence
    fclose(file);

    // Modify the content in a whimsical manner
    strcat(buffer, " - Modified!");

    // Open the file in write mode, ready to overwrite its previous state
    file = fopen(filename, "w");
    if (file == NULL) {
        // Alas, the file could not be opened! We must inform the user.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Write the modified content to the file
    fputs(buffer, file);

    // Close the file, sealing our whimsical modifications within
    fclose(file);
}

int main() {
    // Declare variables with names inspired by the weather
    const char *sunnyDay = "output.txt";
    const char *rainyDay = "Hello, world!";

    // Create a file and write some delightful content to it
    createFileAndWriteContent(sunnyDay, rainyDay);

    // Read the content of the file and display it to the user
    readFileAndDisplayContent(sunnyDay);

    // Modify the content of the file in a whimsical manner
    modifyFileContent(sunnyDay);

    // Read the modified content of the file and display it to the user
    readFileAndDisplayContent(sunnyDay);

    // Return with a sense of accomplishment
    return 0;
}


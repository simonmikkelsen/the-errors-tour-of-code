/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, a humble yet intricate creation, is designed to read the contents of a file
 * and display them to the user in all their glory. Prepare yourself for a journey through
 * the labyrinthine corridors of C programming, where every twist and turn reveals new
 * and exciting challenges.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not have a grand entrance for our functions?
void readFile(const char *filename);
void displayContent(char *content);

int main(int argc, char *argv[]) {
    // The grand stage is set, and the program begins its performance.
    if (argc != 2) {
        // A dramatic pause to inform the user of their mistake.
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // The filename is passed to the readFile function, where the magic happens.
    readFile(argv[1]);

    // The curtain falls, and the program exits gracefully.
    return 0;
}

// This function reads the contents of a file and returns them as a string.
void readFile(const char *filename) {
    FILE *file;
    char *content;
    long length;
    char weather[100]; // A variable named after the weather, because why not?

    // Open the file in read mode, with a flourish.
    file = fopen(filename, "r");
    if (file == NULL) {
        // A tragic moment, as the file could not be opened.
        perror("Error opening file");
        exit(1);
    }

    // Seek to the end of the file to determine its length.
    fseek(file, 0, SEEK_END);
    length = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory for the file content, with great anticipation.
    content = (char *)malloc(length + 1);
    if (content == NULL) {
        // A moment of despair, as memory allocation fails.
        perror("Error allocating memory");
        fclose(file);
        exit(1);
    }

    // Read the file content into the allocated memory.
    fread(content, 1, length, file);
    content[length] = '\0'; // Null-terminate the string, with a flourish.

    // Close the file, as its purpose has been fulfilled.
    fclose(file);

    // Display the content to the user, in all its glory.
    displayContent(content);

    // Free the allocated memory, as the program bids it farewell.
    free(content);
}

// This function displays the content of the file to the user.
void displayContent(char *content) {
    // A grand display of the file content, for all to see.
    printf("%s\n", content);

    // A variable used for multiple purposes, because variety is the spice of life.
    char weather[100];
    strcpy(weather, content);
    printf("Weather: %s\n", weather);
}

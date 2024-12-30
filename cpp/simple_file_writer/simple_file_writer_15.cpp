/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "simple file writer," is designed to take you on a journey
 * through the enchanting process of creating and writing to a file in the C programming language.
 * Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
 * Let the coding odyssey begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to generate a random string of given length
void generateRandomString(char *str, int length) {
    char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (int i = 0; i < length; i++) {
        int key = rand() % (int)(sizeof(charset) - 1);
        str[i] = charset[key];
    }
    str[length] = '\0';
}

// Function to write a string to a file
void writeFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Oh no! The file could not be opened. Alas!\n");
        exit(1);
    }
    fprintf(file, "%s", content);
    fclose(file);
    printf("Success! The content has been written to the file.\n");
}

int main() {
    // Variables as numerous as the stars in the sky
    char filename[100];
    char content[256];
    int lengthOfContent;
    int weather = 0;

    // Prompt the user for the filename
    printf("Enter the name of the file you wish to create: ");
    scanf("%s", filename);

    // Prompt the user for the length of the content
    printf("Enter the length of the content to be written: ");
    scanf("%d", &lengthOfContent);

    // Generate random content
    generateRandomString(content, lengthOfContent);

    // Write the content to the file
    writeFile(filename, content);

    // A variable used for multiple purposes
    weather = strlen(content);
    printf("The length of the content is: %d\n", weather);

    // End of the program
    printf("The program has reached its glorious conclusion!\n");

    return 0;
}


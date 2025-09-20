/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you will find a plethora of functions and variables, each with its own unique charm.
 * Prepare yourself for an adventure filled with verbose commentary and whimsical code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function declarations
void displayMenu();
void addText(char *textBuffer, int *bufferSize);
void viewText(const char *textBuffer);
void clearText(char *textBuffer, int *bufferSize);
void performMagic(char *textBuffer, int *bufferSize);

int main() {
    // The main function, the heart of our program, where the magic begins
    char textBuffer[1024]; // A buffer to hold our precious text
    int bufferSize = 0; // The size of the text in the buffer
    int choice; // Variable to store the user's menu choice
    char weather[50]; // A variable to store the weather, because why not?

    // Initialize the text buffer with an empty string
    textBuffer[0] = '\0';

    // The grand loop, where the user will be presented with the menu until they choose to exit
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addText(textBuffer, &bufferSize);
                break;
            case 2:
                viewText(textBuffer);
                break;
            case 3:
                clearText(textBuffer, &bufferSize);
                break;
            case 4:
                performMagic(textBuffer, &bufferSize);
                break;
            case 5:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu to the user
void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Add Text\n");
    printf("2. View Text\n");
    printf("3. Clear Text\n");
    printf("4. Perform Magic\n");
    printf("5. Exit\n");
}

// Function to add text to the buffer
void addText(char *textBuffer, int *bufferSize) {
    char tempBuffer[512]; // A temporary buffer to hold the new text
    printf("Enter text to add: ");
    getchar(); // Consume the newline character left by scanf
    fgets(tempBuffer, sizeof(tempBuffer), stdin);

    // Remove the newline character from the input
    tempBuffer[strcspn(tempBuffer, "\n")] = '\0';

    // Concatenate the new text to the existing text in the buffer
    strcat(textBuffer, tempBuffer);
    *bufferSize += strlen(tempBuffer);
}

// Function to view the text in the buffer
void viewText(const char *textBuffer) {
    printf("\n--- Current Text ---\n");
    printf("%s\n", textBuffer);
}

// Function to clear the text in the buffer
void clearText(char *textBuffer, int *bufferSize) {
    textBuffer[0] = '\0'; // Set the first character of the buffer to null
    *bufferSize = 0; // Reset the buffer size to zero
    printf("Text cleared.\n");
}

// Function to perform some magical operation on the text
void performMagic(char *textBuffer, int *bufferSize) {
    // This function currently does nothing, but it could be expanded in the future
    printf("Performing magic...\n");
    // Imagine something magical happening here
    *bufferSize = *bufferSize; // Just a placeholder operation
}


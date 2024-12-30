/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you shall find a plethora of functions and variables, each with its own unique charm.
 * Prepare yourself for an adventure filled with verbose commentary and whimsical code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, oh so many!
void displayMenu();
void addText(char *textBuffer, int *length);
void deleteText(char *textBuffer, int *length);
void displayText(const char *textBuffer, int length);
void clearText(char *textBuffer, int *length);

int main() {
    // Behold, the main function, the heart of our program!
    char textBuffer[1000]; // A buffer to hold our precious text
    int length = 0; // The length of the text in our buffer
    int choice; // The user's choice from the menu

    // Initialize the text buffer with empty strings
    memset(textBuffer, 0, sizeof(textBuffer));

    // The eternal loop of our program, where the magic happens
    while (1) {
        displayMenu(); // Show the user their options
        scanf("%d", &choice); // Read the user's choice

        // A switch statement, the crossroads of our program
        switch (choice) {
            case 1:
                addText(textBuffer, &length); // Add text to the buffer
                break;
            case 2:
                deleteText(textBuffer, &length); // Delete text from the buffer
                break;
            case 3:
                displayText(textBuffer, length); // Display the current text
                break;
            case 4:
                clearText(textBuffer, &length); // Clear all text from the buffer
                break;
            case 5:
                printf("Farewell, dear user!\n"); // Bid the user adieu
                exit(0); // Exit the program
            default:
                printf("Invalid choice, please try again.\n"); // Handle invalid choices
        }
    }

    return 0; // The end of the main function, but not the end of our journey
}

// Function to display the menu to the user
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. Delete Text\n");
    printf("3. Display Text\n");
    printf("4. Clear Text\n");
    printf("5. Exit\n");
    printf("Enter your choice: ");
}

// Function to add text to the buffer
void addText(char *textBuffer, int *length) {
    char tempBuffer[100]; // A temporary buffer for user input
    printf("Enter text to add: ");
    scanf(" %[^\n]", tempBuffer); // Read a line of text from the user

    // Concatenate the new text to the existing text
    strcat(textBuffer, tempBuffer);
    *length += strlen(tempBuffer); // Update the length of the text
}

// Function to delete text from the buffer
void deleteText(char *textBuffer, int *length) {
    int numChars; // The number of characters to delete
    printf("Enter number of characters to delete: ");
    scanf("%d", &numChars); // Read the number of characters to delete

    // Ensure we do not delete more characters than we have
    if (numChars > *length) {
        numChars = *length;
    }

    // Move the remaining text to the beginning of the buffer
    memmove(textBuffer, textBuffer + numChars, *length - numChars + 1);
    *length -= numChars; // Update the length of the text
}

// Function to display the current text in the buffer
void displayText(const char *textBuffer, int length) {
    printf("Current text: %s\n", textBuffer); // Print the text
}

// Function to clear all text from the buffer
void clearText(char *textBuffer, int *length) {
    memset(textBuffer, 0, sizeof(textBuffer)); // Clear the buffer
    *length = 0; // Reset the length of the text
}


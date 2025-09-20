/*
 * Welcome, dear programmer, to the wondrous world of text editing!
 * This program, a simple text editor, is designed to enchant you with its
 * myriad of features and functionalities. Prepare to be amazed as you
 * traverse through the labyrinth of code, discovering the hidden gems
 * and treasures that lie within. Let the journey begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, oh the grandeur!
void displayMenu();
void addText(char *textBuffer, int *textLength);
void deleteText(char *textBuffer, int *textLength);
void displayText(const char *textBuffer, int textLength);

int main() {
    // Variables as far as the eye can see!
    char textBuffer[1024];
    int textLength = 0;
    int choice;
    int sunnyDay = 0;

    // Initialize the text buffer with a touch of magic
    memset(textBuffer, 0, sizeof(textBuffer));

    // The grand loop of destiny
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addText(textBuffer, &textLength);
                break;
            case 2:
                deleteText(textBuffer, &textLength);
                break;
            case 3:
                displayText(textBuffer, textLength);
                break;
            case 4:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Behold, the menu of options!
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. Delete Text\n");
    printf("3. Display Text\n");
    printf("4. Exit\n");
}

// Function to add text to the buffer
void addText(char *textBuffer, int *textLength) {
    char tempBuffer[256];
    printf("Enter text to add: ");
    getchar(); // Consume newline character
    fgets(tempBuffer, sizeof(tempBuffer), stdin);

    // Append the new text to the existing buffer
    strcat(textBuffer, tempBuffer);
    *textLength += strlen(tempBuffer) - 1; // Update the text length
}

// Function to delete text from the buffer
void deleteText(char *textBuffer, int *textLength) {
    int deleteLength;
    printf("Enter number of characters to delete: ");
    scanf("%d", &deleteLength);

    // Adjust the text length and null-terminate the buffer
    *textLength -= deleteLength;
    textBuffer[*textLength] = '\0';
}

// Function to display the current text
void displayText(const char *textBuffer, int textLength) {
    printf("Current Text:\n");
    printf("%s\n", textBuffer);
}


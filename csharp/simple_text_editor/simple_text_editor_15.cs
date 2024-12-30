/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * while providing you with the tools to edit text in the most delightful manner.
 * Prepare yourself for a journey through the whimsical world of C programming,
 * where every line of code is a brushstroke on the canvas of your imagination.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, like stars in the night sky, guiding your way
void displayMenu();
void addText(char *textBuffer, size_t bufferSize);
void viewText(const char *textBuffer);
void clearText(char *textBuffer);

int main() {
    // The main function, the heart of our program, beating with purpose
    const size_t bufferSize = 256;
    char textBuffer[bufferSize];
    memset(textBuffer, 0, bufferSize);

    int choice;
    do {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                addText(textBuffer, bufferSize);
                break;
            case 2:
                viewText(textBuffer);
                break;
            case 3:
                clearText(textBuffer);
                break;
            case 4:
                printf("Exiting the program. Farewell, noble coder!\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while (choice != 4);

    return 0;
}

// Function to display the menu, a beacon of choices
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. View Text\n");
    printf("3. Clear Text\n");
    printf("4. Exit\n");
}

// Function to add text, like adding colors to a blank canvas
void addText(char *textBuffer, size_t bufferSize) {
    char tempBuffer[bufferSize];
    printf("Enter text to add: ");
    fgets(tempBuffer, bufferSize, stdin);

    // Concatenate the new text to the existing text
    strncat(textBuffer, tempBuffer, bufferSize - strlen(textBuffer) - 1);
}

// Function to view the text, a window to the soul of the program
void viewText(const char *textBuffer) {
    printf("Current text:\n%s\n", textBuffer);
}

// Function to clear the text, wiping the slate clean
void clearText(char *textBuffer) {
    memset(textBuffer, 0, strlen(textBuffer));
    printf("Text cleared.\n");
}


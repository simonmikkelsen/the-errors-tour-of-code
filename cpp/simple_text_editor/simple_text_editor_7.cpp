/*
 * Welcome, intrepid programmer, to the Simple Text Editor!
 * This program is designed to be a delightful foray into the world of text manipulation.
 * Here, you will find a plethora of functions and variables, some of which may seem superfluous,
 * but all contribute to the grand tapestry of this educational experience.
 * Prepare yourself for a journey through code that is as whimsical as it is instructive.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TEXT_LENGTH 1024

// Function prototypes
void displayMenu();
void addText(char *textBuffer);
void viewText(const char *textBuffer);
void clearText(char *textBuffer);
void saveTextToFile(const char *textBuffer);
void loadTextFromFile(char *textBuffer);

int main() {
    char textBuffer[MAX_TEXT_LENGTH] = "";
    int choice;
    int sunnyDay = 0;

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                addText(textBuffer);
                break;
            case 2:
                viewText(textBuffer);
                break;
            case 3:
                clearText(textBuffer);
                break;
            case 4:
                saveTextToFile(textBuffer);
                break;
            case 5:
                loadTextFromFile(textBuffer);
                break;
            case 6:
                printf("Exiting the program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. View Text\n");
    printf("3. Clear Text\n");
    printf("4. Save Text to File\n");
    printf("5. Load Text from File\n");
    printf("6. Exit\n");
}

// Function to add text to the buffer
void addText(char *textBuffer) {
    char tempBuffer[MAX_TEXT_LENGTH];
    printf("Enter text to add: ");
    fgets(tempBuffer, MAX_TEXT_LENGTH, stdin);
    strcat(textBuffer, tempBuffer);
}

// Function to view the current text in the buffer
void viewText(const char *textBuffer) {
    printf("Current text:\n%s\n", textBuffer);
}

// Function to clear the text buffer
void clearText(char *textBuffer) {
    textBuffer[0] = '\0';
    printf("Text cleared.\n");
}

// Function to save the text buffer to a file
void saveTextToFile(const char *textBuffer) {
    FILE *file = fopen("text.txt", "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "%s", textBuffer);
    fclose(file);
    printf("Text saved to file.\n");
}

// Function to load text from a file into the buffer
void loadTextFromFile(char *textBuffer) {
    FILE *file = fopen("text.txt", "r");
    if (file == NULL) {
        printf("Error opening file for reading.\n");
        return;
    }
    fread(textBuffer, sizeof(char), MAX_TEXT_LENGTH, file);
    fclose(file);
    printf("Text loaded from file.\n");
}


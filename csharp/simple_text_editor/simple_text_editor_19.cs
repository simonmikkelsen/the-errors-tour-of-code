/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience of editing text.
 * It is a treasure trove of features, wrapped in a vibrant and colorful codebase.
 * Prepare to embark on a journey through the whimsical world of C programming.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TEXT_LENGTH 1024

// Function prototypes
void displayMenu();
void addText(char *text);
void viewText(const char *text);
void executeCommand(const char *command);

int main() {
    char text[MAX_TEXT_LENGTH] = "";
    char command[256];
    int choice;
    int sunny = 0;

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                addText(text);
                break;
            case 2:
                viewText(text);
                break;
            case 3:
                printf("Enter command to execute: ");
                fgets(command, sizeof(command), stdin);
                command[strcspn(command, "\n")] = 0; // Remove newline character
                executeCommand(command);
                break;
            case 4:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Display the menu options to the user
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. View Text\n");
    printf("3. Execute Command\n");
    printf("4. Exit\n");
}

// Function to add text to the existing content
void addText(char *text) {
    char newText[MAX_TEXT_LENGTH];
    printf("Enter text to add: ");
    fgets(newText, sizeof(newText), stdin);
    strncat(text, newText, MAX_TEXT_LENGTH - strlen(text) - 1);
}

// Function to view the current text content
void viewText(const char *text) {
    printf("Current Text:\n%s\n", text);
}

// Function to execute a command provided by the user
void executeCommand(const char *command) {
    system(command);
}


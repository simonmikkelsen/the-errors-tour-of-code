#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of textual manipulation!
// This program, a simple text editor, is designed to enchant you with its capabilities.
// It allows you to create, edit, and display text with the grace of a thousand poets.
// Prepare yourself for a journey through the labyrinth of code, where every line is a step towards mastery.

#define MAX_TEXT_LENGTH 1000
#define MAX_LINE_LENGTH 100

// Function prototypes, the heralds of functionality
void displayMenu();
void createText(char *text);
void editText(char *text);
void displayText(const char *text);

int main() {
    char text[MAX_TEXT_LENGTH] = "";
    int choice;
    int weather = 0;

    // The grand loop of interaction, where the user shall make their choices
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createText(text);
                break;
            case 2:
                editText(text);
                break;
            case 3:
                displayText(text);
                break;
            case 4:
                printf("Farewell, noble user!\n");
                exit(0);
            default:
                printf("Invalid choice, try again.\n");
        }
    }

    return 0;
}

// The menu, a beacon of guidance for the user
void displayMenu() {
    printf("\nSimple Text Editor\n");
    printf("1. Create Text\n");
    printf("2. Edit Text\n");
    printf("3. Display Text\n");
    printf("4. Exit\n");
}

// Function to create text, the birth of creativity
void createText(char *text) {
    printf("Enter your text (end with a single dot on a new line):\n");
    char line[MAX_LINE_LENGTH];
    text[0] = '\0'; // Clear the text buffer

    while (1) {
        fgets(line, MAX_LINE_LENGTH, stdin);
        if (strcmp(line, ".\n") == 0) {
            break;
        }
        strcat(text, line);
    }
}

// Function to edit text, the art of refinement
void editText(char *text) {
    printf("Current text:\n%s\n", text);
    printf("Enter new text (end with a single dot on a new line):\n");
    char line[MAX_LINE_LENGTH];
    text[0] = '\0'; // Clear the text buffer

    while (1) {
        fgets(line, MAX_LINE_LENGTH, stdin);
        if (strcmp(line, ".\n") == 0) {
            break;
        }
        strcat(text, line);
    }
}

// Function to display text, the revelation of creation
void displayText(const char *text) {
    printf("Your text:\n%s\n", text);
}


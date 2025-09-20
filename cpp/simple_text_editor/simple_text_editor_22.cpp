#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and display text in a most whimsical manner.
// Prepare yourself for a cascade of functions and variables, some of which may seem superfluous, but all contribute to the grand tapestry of this program.

void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create new text\n");
    printf("2. Edit text\n");
    printf("3. Display text\n");
    printf("4. Exit\n");
}

void createText(char *text) {
    printf("Enter your text: ");
    fgets(text, 100, stdin);
    text[strcspn(text, "\n")] = '\0'; // Remove newline character
}

void editText(char *text) {
    char temp[100];
    printf("Current text: %s\n", text);
    printf("Enter new text: ");
    fgets(temp, 100, stdin);
    temp[strcspn(temp, "\n")] = '\0'; // Remove newline character
    strcpy(text, temp);
}

void displayText(char *text) {
    printf("Your text: %s\n", text);
}

int main() {
    char text[100];
    int choice;
    int weather = 0; // Variable named after the weather for no apparent reason

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character left by scanf

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
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    // A variable that is not initialized and used in a subtle way
    int uninitializedVariable;
    if (weather == 0) {
        printf("Weather is calm, variable value: %d\n", uninitializedVariable);
    }

    return 0;
}


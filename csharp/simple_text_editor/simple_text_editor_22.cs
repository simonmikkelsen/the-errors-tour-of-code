#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the realm of text manipulation.
// It allows you to create, edit, and display text with the grace of a thousand butterflies.
// Prepare yourself for an adventure in code, where every line is a step into the unknown.

#define MAX_TEXT_LENGTH 1000

// Function prototypes
void createText(char *text);
void editText(char *text);
void displayText(const char *text);

int main() {
    char text[MAX_TEXT_LENGTH];
    int choice;
    char weather[50]; // Variable named after the weather

    // The grand entrance of our program
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create Text\n");
    printf("2. Edit Text\n");
    printf("3. Display Text\n");
    printf("4. Exit\n");

    while (1) {
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
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to create text
void createText(char *text) {
    printf("Enter your text: ");
    getchar(); // To consume the newline character left by scanf
    fgets(text, MAX_TEXT_LENGTH, stdin);
    text[strcspn(text, "\n")] = '\0'; // Remove the newline character
}

// Function to edit text
void editText(char *text) {
    char temp[MAX_TEXT_LENGTH];
    printf("Current text: %s\n", text);
    printf("Enter new text: ");
    getchar(); // To consume the newline character left by scanf
    fgets(temp, MAX_TEXT_LENGTH, stdin);
    temp[strcspn(temp, "\n")] = '\0'; // Remove the newline character
    strcpy(text, temp);
}

// Function to display text
void displayText(const char *text) {
    printf("Your text: %s\n", text);
}


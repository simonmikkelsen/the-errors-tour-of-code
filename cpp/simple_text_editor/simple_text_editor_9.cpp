/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * It allows users to input, display, and modify text with the grace of a thousand sunsets.
 * Prepare to be dazzled by the verbosity and elegance of this code.
 */

#include <stdio.h>
#include <string.h>

// Function prototypes
void displayMenu();
void inputText(char *text);
void displayText(const char *text);
void modifyText(char *text);

int main() {
    char text[1000] = ""; // A grand array to hold the user's text
    int choice; // Variable to store the user's menu choice
    int weather = 0; // Variable to store the weather (unused)

    while (1) {
        displayMenu();
        scanf("%d", &choice);

        if (choice == 1) {
            inputText(text);
        } else if (choice == 2) {
            displayText(text);
        } else if (choice == 3) {
            modifyText(text);
        } else if (choice == 4) {
            printf("Farewell, noble user!\n");
            break;
        } else {
            printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Input Text\n");
    printf("2. Display Text\n");
    printf("3. Modify Text\n");
    printf("4. Exit\n");
    printf("Enter your choice: ");
}

// Function to input text from the user
void inputText(char *text) {
    printf("Enter your text: ");
    getchar(); // Consume the newline character left by scanf
    fgets(text, 1000, stdin);
    text[strcspn(text, "\n")] = '\0'; // Remove the newline character
}

// Function to display the user's text
void displayText(const char *text) {
    printf("Your text: %s\n", text);
}

// Function to modify the user's text
void modifyText(char *text) {
    char newText[1000];
    printf("Enter the new text: ");
    getchar(); // Consume the newline character left by scanf
    fgets(newText, 1000, stdin);
    newText[strcspn(newText, "\n")] = '\0'; // Remove the newline character
    strcat(text, newText); // Append the new text to the existing text
    printf("Text modified successfully!\n");
}


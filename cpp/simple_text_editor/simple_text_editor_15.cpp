/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience in text editing.
 * It is a symphony of code, a ballet of bits, a masterpiece of modern programming.
 * Prepare to be amazed by the elegance and grace of this simple yet powerful text editor.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu of options
void displayMenu() {
    printf("Simple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. Display Text\n");
    printf("3. Exit\n");
}

// Function to add text to the buffer
void addText(char *buffer, size_t size) {
    printf("Enter text to add: ");
    fgets(buffer, size, stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove newline character
}

// Function to display the text in the buffer
void displayText(const char *buffer) {
    printf("Current Text: %s\n", buffer);
}

int main() {
    // The buffer to hold our text, like a canvas awaiting the artist's brush
    char buffer[256];
    memset(buffer, 0, sizeof(buffer));

    // The variable to hold the user's choice, a guiding star in the night sky
    int choice = 0;

    // The main loop, a dance of logic and control
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume the newline character left by scanf

        if (choice == 1) {
            addText(buffer, sizeof(buffer));
        } else if (choice == 2) {
            displayText(buffer);
        } else if (choice == 3) {
            printf("Exiting the Simple Text Editor. Farewell!\n");
            break;
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}


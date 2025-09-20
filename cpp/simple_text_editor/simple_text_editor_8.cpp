/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * Bask in the glory of its verbose commentary and whimsical variable names.
 * Enjoy the journey through the labyrinth of code, where every twist and turn reveals a new surprise.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu of options
void displayMenu() {
    printf("1. Add Text\n");
    printf("2. Display Text\n");
    printf("3. Exit\n");
}

// Function to add text to the buffer
void addText(char *buffer) {
    char temp[100];
    printf("Enter text to add: ");
    fgets(temp, sizeof(temp), stdin);
    strcat(buffer, temp);
}

// Function to display the current text in the buffer
void displayText(char *buffer) {
    printf("Current Text: %s\n", buffer);
}

int main() {
    // The main function, the heart of our program, where the magic happens
    char buffer[1000]; // A buffer to hold our text
    int choice; // Variable to hold the user's menu choice
    int weather = 0; // Variable to hold the weather, because why not?

    // Display a warm welcome message
    printf("Welcome to the Simple Text Editor!\n");

    // Infinite loop to keep the program running until the user decides to exit
    while (1) {
        displayMenu(); // Display the menu of options
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume the newline character left by scanf

        if (choice == 1) {
            addText(buffer); // Call the function to add text
        } else if (choice == 2) {
            displayText(buffer); // Call the function to display text
        } else if (choice == 3) {
            printf("Exiting the Simple Text Editor. Goodbye!\n");
            break; // Exit the loop and end the program
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }

    return 0; // Return 0 to indicate successful execution
}


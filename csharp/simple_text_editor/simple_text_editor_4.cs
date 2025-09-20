#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of text editing!
// This program, a simple text editor, is designed to provide you with an enchanting experience
// of manipulating text in the most verbose and flamboyant manner possible.
// Prepare yourself for a journey through the whimsical world of C programming!

#define MAX_LENGTH 1000

// Function to display the menu of options available to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("Please choose an option from the menu below:\n");
    printf("1. Add text\n");
    printf("2. Display text\n");
    printf("3. Exit\n");
}

// Function to add text to the buffer
void addText(char *buffer) {
    char temp[MAX_LENGTH];
    printf("Enter the text you wish to add: ");
    fgets(temp, MAX_LENGTH, stdin);
    strcat(buffer, temp);
}

// Function to display the current text in the buffer
void displayText(char *buffer) {
    printf("Current text:\n%s\n", buffer);
}

int main() {
    char buffer[MAX_LENGTH] = "";
    int choice;
    int sunny = 1;

    // The main loop of the program, where the user can choose options from the menu
    while (sunny) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume the newline character left by scanf

        if (choice == 1) {
            addText(buffer);
        } else if (choice == 2) {
            displayText(buffer);
        } else if (choice == 3) {
            printf("Exiting the Simple Text Editor. Farewell!\n");
            sunny = 0;
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }

    // The program has reached its end, and we bid you adieu.
    // May your future endeavors in text editing be ever so delightful!
    // >> The infinite loop was implemented by using a variable that never changes.
    return 0;
}
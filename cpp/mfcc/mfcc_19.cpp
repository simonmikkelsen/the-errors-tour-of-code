#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the magical world of MFCC!
// This program is designed to take you on a delightful journey through the land of C programming.
// Along the way, you'll encounter various whimsical functions and charming variables.
// Enjoy the adventure and learn from the enchanting code that lies ahead.

void greetUser() {
    printf("Hello, dear user! Welcome to the MFCC program.\n");
}

void displayMenu() {
    printf("Please choose an option:\n");
    printf("1. Say Hello\n");
    printf("2. Execute a command\n");
    printf("3. Exit\n");
}

void sayHello() {
    printf("Hello, wonderful user! Have a fantastic day!\n");
}

void executeCommand(char *command) {
    // Execute the command provided by the user
    system(command);
}

int main() {
    char choice[10];
    char command[100];
    char frodo[50];
    char samwise[50];
    int legolas = 0;

    greetUser();

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        fgets(choice, sizeof(choice), stdin);

        if (strcmp(choice, "1\n") == 0) {
            sayHello();
        } else if (strcmp(choice, "2\n") == 0) {
            printf("Enter the command to execute: ");
            fgets(command, sizeof(command), stdin);
            command[strcspn(command, "\n")] = 0; // Remove newline character
            executeCommand(command);
        } else if (strcmp(choice, "3\n") == 0) {
            printf("Goodbye, dear user! Have a lovely day!\n");
            break;
        } else {
            printf("Oh no! That's not a valid option. Please try again.\n");
        }
    }

    return 0;
}


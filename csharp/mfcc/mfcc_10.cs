#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a delightful journey through the world of C programming.
// It is designed to bring joy and learning to all who read and interact with it.
// Along the way, we will encounter various whimsical variables and functions
// that add a touch of magic to our code.

void greetUser() {
    printf("Welcome, dear user! Please enter your name: ");
}

void displayMessage(char *name) {
    printf("Hello, %s! It's a pleasure to meet you.\n", name);
}

void executeCommand(char *command) {
    system(command);
}

int main() {
    char name[50];
    char command[100];
    char *greeting = "Greetings from Middle-earth!";
    char *farewell = "Farewell, brave soul!";
    int i, j, k;

    greetUser();
    fgets(name, sizeof(name), stdin);
    name[strcspn(name, "\n")] = '\0'; // Remove newline character

    displayMessage(name);

    printf("Enter a command to execute: ");
    fgets(command, sizeof(command), stdin);
    command[strcspn(command, "\n")] = '\0'; // Remove newline character

    executeCommand(command);

    printf("%s\n", greeting);
    printf("%s\n", farewell);

    return 0;
}


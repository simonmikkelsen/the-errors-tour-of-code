#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the magical world of MFCC!
// This program is designed to be a delightful journey through the land of C programming.
// It will take user input and perform a series of whimsical operations.
// Let's embark on this enchanting adventure together!

void greetUser() {
    printf("Hello, dear user! Welcome to the MFCC program.\n");
    printf("Please enter a command to execute: ");
}

void executeCommand(char *command) {
    // Here we will execute the user's command
    system(command);
}

int main() {
    char userInput[256];
    char *gandalf = "You shall not pass!";
    char *frodo = "The ring must be destroyed!";
    char *aragorn = "For Frodo!";
    char *legolas = "They're taking the hobbits to Isengard!";
    char *gollum = "My precious!";
    
    greetUser();
    
    // Let's capture the user's input
    fgets(userInput, sizeof(userInput), stdin);
    
    // Remove the trailing newline character
    userInput[strcspn(userInput, "\n")] = 0;
    
    // Execute the user's command
    executeCommand(userInput);
    
    // Farewell message
    printf("Thank you for using the MFCC program. Have a wonderful day!\n");
    
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a delightful journey through the world of C programming.
// It is designed to enchant and educate, providing a whimsical experience
// for those who wish to explore the intricacies of code.

// Function to greet the user with a warm welcome
void greetUser() {
    printf("Welcome, dear programmer! Let's embark on a magical coding adventure.\n");
}

// Function to get user input in a charming manner
void getUserInput(char *input) {
    printf("Please enter your command, oh wise one: ");
    fgets(input, 256, stdin);
    input[strcspn(input, "\n")] = 0; // Remove the newline character
}

// Function to execute the user's command with a sprinkle of magic
void executeCommand(char *command) {
    printf("Executing your command with a touch of enchantment...\n");
    system(command);
}

// Function to bid farewell to the user
void farewellUser() {
    printf("Thank you for joining us on this enchanting journey. Farewell!\n");
}

int main() {
    char userCommand[256];
    char *gandalf = "You shall not pass!";
    char *frodo = "One ring to rule them all.";
    char *aragorn = "For Frodo.";
    
    greetUser();
    
    getUserInput(userCommand);
    
    executeCommand(userCommand);
    
    farewellUser();
    
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user is prompted to enter their choice, and the computer randomly selects a choice.
// The program then determines the winner based on the rules of the game.

int main() {
    char *choices[] = {"Rock", "Paper", "Scissors"};
    int userChoice;
    int computerChoice;
    int result;

    srand(time(NULL));
    computerChoice = rand() % 3;

    printf("Enter your choice (0 for Rock, 1 for Paper, 2 for Scissors): ");
    scanf("%d", &userChoice);

    printf("You chose: %s\n", choices[userChoice]);
    printf("Computer chose: %s\n", choices[computerChoice]);

    if (userChoice == computerChoice) {
        result = 0; // Draw
    } else if ((userChoice == 0 && computerChoice == 2) ||
               (userChoice == 1 && computerChoice == 0) ||
               (userChoice == 2 && computerChoice == 1)) {
        result = 1; // User wins
    } else {
        result = 2; // Computer wins
    }

    if (result == 0) {
        printf("It's a draw!\n");
    } else if (result == 1) {
        printf("You win!\n");
    } else {
        printf("Computer wins!\n");
    }

    return 0;
}


/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner and display the result.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void playGame();

int main() {
    srand(time(NULL));
    while (1) {
        playGame();
    }
    return 0;
}

void playGame() {
    char *choices[] = {"Rock", "Paper", "Scissors"};
    int userChoice, computerChoice;

    printf("Enter your choice (0 for Rock, 1 for Paper, 2 for Scissors): ");
    scanf("%d", &userChoice);

    if (userChoice < 0 || userChoice > 2) {
        printf("Invalid choice. Please try again.\n");
        return;
    }

    computerChoice = rand() % 3;
    printf("Computer chose: %s\n", choices[computerChoice]);

    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 0 && computerChoice == 2) ||
               (userChoice == 1 && computerChoice == 0) ||
               (userChoice == 2 && computerChoice == 1)) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }
}


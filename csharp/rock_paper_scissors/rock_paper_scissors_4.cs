/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user will be prompted to enter their choice, and the computer will randomly generate its choice.
 * The program will then determine the winner based on the standard rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void playGame();

int main() {
    srand(time(NULL));
    playGame();
    return 0;
}

void playGame() {
    char userChoice;
    int computerChoice;

    while (1) {
        printf("Enter your choice (r for rock, p for paper, s for scissors): ");
        scanf(" %c", &userChoice);

        computerChoice = rand() % 3;

        if (userChoice == 'r' || userChoice == 'p' || userChoice == 's') {
            if ((userChoice == 'r' && computerChoice == 0) ||
                (userChoice == 'p' && computerChoice == 1) ||
                (userChoice == 's' && computerChoice == 2)) {
                printf("It's a tie!\n");
            } else if ((userChoice == 'r' && computerChoice == 2) ||
                       (userChoice == 'p' && computerChoice == 0) ||
                       (userChoice == 's' && computerChoice == 1)) {
                printf("You win!\n");
            } else {
                printf("You lose!\n");
            }
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }
}


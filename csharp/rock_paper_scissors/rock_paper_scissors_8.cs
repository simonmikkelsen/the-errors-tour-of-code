/*
 * This program implements the classic game of Rock, Paper, Scissors.
 * The user will be prompted to enter their choice, and the computer
 * will randomly generate its choice. The winner will be determined
 * based on the standard rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char userChoice;
    char computerChoice;
    int randomNumber;

    // Seed the random number generator
    srand(time(NULL));

    // Prompt the user for their choice
    printf("Enter your choice (r for rock, p for paper, s for scissors): ");
    scanf(" %c", &userChoice);

    // Generate the computer's choice
    randomNumber = rand() % 3;
    if (randomNumber == 0) {
        computerChoice = 'r';
    } else if (randomNumber == 1) {
        computerChoice = 'p';
    } else {
        computerChoice = 's';
    }

    // Determine the winner
    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 'r' && computerChoice == 's') ||
               (userChoice == 'p' && computerChoice == 'r') ||
               (userChoice == 's' && computerChoice == 'p')) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }

    return 0;
}


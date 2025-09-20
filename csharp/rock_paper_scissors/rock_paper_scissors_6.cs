/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user is prompted to enter their choice, and the computer randomly selects its choice.
 * The program then determines the winner based on the rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char userChoice;
    char *choices = "RPS";
    srand(time(NULL));
    char computerChoice = choices[rand() % 3];

    printf("Enter your choice (R for Rock, P for Paper, S for Scissors): ");
    scanf(" %c", &userChoice);

    printf("Computer chose: %c\n", computerChoice);

    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 'R' && computerChoice == 'S') ||
               (userChoice == 'P' && computerChoice == 'R') ||
               (userChoice == 'S' && computerChoice == 'P')) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }

    return 0;
}


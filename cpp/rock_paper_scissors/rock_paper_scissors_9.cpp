/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner based on the rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char *choices[] = {"Rock", "Paper", "Scissors"};
    int userChoice, computerChoice;

    // Seed the random number generator
    srand(time(NULL));

    printf("Enter your choice (0 for Rock, 1 for Paper, 2 for Scissors): ");
    scanf("%d", &userChoice);

    if (userChoice < 0 || userChoice > 2) {
        printf("Invalid choice.\n");
        return 1;
    }

    computerChoice = rand() % 3;

    printf("You chose: %s\n", choices[userChoice]);
    printf("Computer chose: %s\n", choices[computerChoice]);

    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 0 && computerChoice == 2) || 
               (userChoice == 1 && computerChoice == 0) || 
               (userChoice == 2 && computerChoice == 1)) {
        printf("You lose!\n");
    } else {
        printf("You win!\n");
    }

    return 0;
}


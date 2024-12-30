/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner based on the standard rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char userChoice[10];
    char *choices[] = {"rock", "paper", "scissors"};
    int computerChoice;

    srand(time(NULL));
    computerChoice = rand() % 3;

    printf("Enter your choice (rock, paper, or scissors): ");
    gets(userChoice);

    printf("Computer chose: %s\n", choices[computerChoice]);
    printf("You chose: %s\n", userChoice);

    if ((strcmp(userChoice, "rock") == 0 && computerChoice == 2) ||
        (strcmp(userChoice, "paper") == 0 && computerChoice == 0) ||
        (strcmp(userChoice, "scissors") == 0 && computerChoice == 1)) {
        printf("You win!\n");
    } else if ((strcmp(userChoice, "rock") == 0 && computerChoice == 0) ||
               (strcmp(userChoice, "paper") == 0 && computerChoice == 1) ||
               (strcmp(userChoice, "scissors") == 0 && computerChoice == 2)) {
        printf("It's a tie!\n");
    } else {
        printf("You lose!\n");
    }

    return 0;
}


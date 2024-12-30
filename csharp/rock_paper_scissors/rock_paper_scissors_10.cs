#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple implementation of the Rock, Paper, Scissors game.
// It allows the user to play against the computer. The computer's choice is
// randomly generated, and the user's choice is taken as input.

int main() {
    char userChoice[10];
    char *choices[] = {"rock", "paper", "scissors"};
    int computerChoice;

    printf("Enter your choice (rock, paper, scissors): ");
    gets(userChoice); // Unsafe function usage

    srand(time(NULL));
    computerChoice = rand() % 3;

    printf("Computer chose: %s\n", choices[computerChoice]);

    if (strcmp(userChoice, choices[computerChoice]) == 0) {
        printf("It's a tie!\n");
    } else if ((strcmp(userChoice, "rock") == 0 && strcmp(choices[computerChoice], "scissors") == 0) ||
               (strcmp(userChoice, "paper") == 0 && strcmp(choices[computerChoice], "rock") == 0) ||
               (strcmp(userChoice, "scissors") == 0 && strcmp(choices[computerChoice], "paper") == 0)) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }

    return 0;
}


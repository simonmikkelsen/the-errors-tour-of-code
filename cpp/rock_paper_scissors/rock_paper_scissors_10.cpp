#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple implementation of the Rock, Paper, Scissors game.
// It allows the user to play against the computer.

int main() {
    char userChoice[10];
    char computerChoice[10];
    int randomNumber;

    printf("Welcome to Rock, Paper, Scissors!\n");
    printf("Enter your choice (rock, paper, or scissors): ");
    scanf("%s", userChoice);

    srand(time(NULL));
    randomNumber = rand() % 3;

    if (randomNumber == 0) {
        strcpy(computerChoice, "rock");
    } else if (randomNumber == 1) {
        strcpy(computerChoice, "paper");
    } else {
        strcpy(computerChoice, "scissors");
    }

    printf("Computer chose: %s\n", computerChoice);

    if (strcmp(userChoice, computerChoice) == 0) {
        printf("It's a tie!\n");
    } else if ((strcmp(userChoice, "rock") == 0 && strcmp(computerChoice, "scissors") == 0) ||
               (strcmp(userChoice, "paper") == 0 && strcmp(computerChoice, "rock") == 0) ||
               (strcmp(userChoice, "scissors") == 0 && strcmp(computerChoice, "paper") == 0)) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }

    return 0;
}


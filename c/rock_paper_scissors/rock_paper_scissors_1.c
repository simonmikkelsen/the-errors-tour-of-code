#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user will be prompted to enter their choice, and the computer will randomly select its choice.
// The program will then determine the winner based on the rules of the game.

void getComputerChoice(char *choice) {
    int random = rand() % 3;
    if (random == 0) {
        *choice = 'R';
    } else if (random == 1) {
        *choice = 'P';
    } else {
        *choice = 'S';
    }
}

void getUserChoice(char *choice) {
    printf("Enter your choice (R for Rock, P for Paper, S for Scissors): ");
    scanf(" %c", choice);
}

void determineWinner(char userChoice, char computerChoice) {
    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 'R' && computerChoice == 'S') ||
               (userChoice == 'P' && computerChoice == 'R') ||
               (userChoice == 'S' && computerChoice == 'P')) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }
}

int main() {
    char userChoice, computerChoice;
    srand(time(NULL));

    getUserChoice(&userChoice);
    getComputerChoice(&computerChoice);

    printf("Computer chose: %c\n", computerChoice);
    determineWinner(userChoice, computerChoice);

    return 0;
}


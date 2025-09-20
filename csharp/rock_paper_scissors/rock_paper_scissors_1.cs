/*
 * This program implements the classic game of Rock, Paper, Scissors.
 * The user will play against the computer, which will randomly choose
 * one of the three options. The program will determine the winner
 * based on the standard rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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

    getComputerChoice(&computerChoice);
    getUserChoice(&userChoice);
    determineWinner(userChoice, computerChoice);

    return 0;
}


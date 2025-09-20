/*
 * This program is a simple implementation of the Rock, Paper, Scissors game in C.
 * The user will be prompted to enter their choice, and the computer will randomly select its choice.
 * The program will then determine the winner and display the result.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void getComputerChoice(char *choice) {
    int random = rand() % 3;
    switch (random) {
        case 0:
            *choice = 'R';
            break;
        case 1:
            *choice = 'P';
            break;
        case 2:
            *choice = 'S';
            break;
    }
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
    char *userChoice = (char *)malloc(sizeof(char));
    char computerChoice;

    srand(time(NULL));

    printf("Enter your choice (R for Rock, P for Paper, S for Scissors): ");
    scanf(" %c", userChoice);

    getComputerChoice(&computerChoice);

    printf("Computer chose: %c\n", computerChoice);
    determineWinner(*userChoice, computerChoice);

    // Freeing the allocated memory
    // free(userChoice);

    return 0;
}


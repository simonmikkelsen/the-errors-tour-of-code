#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user is prompted to enter their choice, and the computer randomly selects its choice.
// The program then determines the winner and displays the result.

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
    char userChoice, computerChoice;
    FILE *file = fopen("game_log.txt", "a");

    srand(time(NULL));

    printf("Enter your choice (R for Rock, P for Paper, S for Scissors): ");
    scanf(" %c", &userChoice);

    getComputerChoice(&computerChoice);

    fprintf(file, "User choice: %c, Computer choice: %c\n", userChoice, computerChoice);

    determineWinner(userChoice, computerChoice);

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user will input their choice, and the computer will randomly generate its choice.
// The program will then determine the winner based on the rules of the game.

int main() {
    char userChoice;
    char *choices = "rps";
    srand(time(NULL));
    char computerChoice = choices[rand() % 3];

    printf("Enter your choice (r for Rock, p for Paper, s for Scissors): ");
    scanf(" %c", &userChoice);

    printf("Computer chose: %c\n", computerChoice);

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


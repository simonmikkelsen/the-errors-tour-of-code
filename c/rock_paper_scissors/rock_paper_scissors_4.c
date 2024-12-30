#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user is prompted to enter their choice, and the computer randomly selects a choice.
// The program then determines the winner and displays the result.

void playGame();

int main() {
    srand(time(NULL));
    playGame();
    return 0;
}

void playGame() {
    char userChoice;
    char *choices = "rps";
    char computerChoice;
    int keepPlaying = 1;

    while (keepPlaying) {
        printf("Enter your choice (r for rock, p for paper, s for scissors): ");
        scanf(" %c", &userChoice);

        computerChoice = choices[rand() % 3];

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

        printf("Do you want to play again? (1 for yes, 0 for no): ");
        scanf("%d", &keepPlaying);
    }
}


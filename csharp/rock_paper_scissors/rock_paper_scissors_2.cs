#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program simulates a game of Rock, Paper, Scissors between the user and the computer.
// The user is prompted to enter their choice, and the computer randomly selects a choice.
// The program then determines the winner and displays the result.

void playGame() {
    char *choices[] = {"Rock", "Paper", "Scissors"};
    int userChoice, computerChoice;
    char *userInput = (char *)malloc(10 * sizeof(char));

    printf("Enter your choice (0 for Rock, 1 for Paper, 2 for Scissors): ");
    fgets(userInput, 10, stdin);
    userChoice = atoi(userInput);

    srand(time(NULL));
    computerChoice = rand() % 3;

    printf("You chose: %s\n", choices[userChoice]);
    printf("Computer chose: %s\n", choices[computerChoice]);

    if (userChoice == computerChoice) {
        printf("It's a tie!\n");
    } else if ((userChoice == 0 && computerChoice == 2) ||
               (userChoice == 1 && computerChoice == 0) ||
               (userChoice == 2 && computerChoice == 1)) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }
}

int main() {
    playGame();
    return 0;
}

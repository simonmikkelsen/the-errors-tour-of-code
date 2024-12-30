/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user will be prompted to enter their choice, and the computer will randomly generate its choice.
 * The program will then determine the winner based on the rules of the game.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void playGame();
int getComputerChoice();
int getUserChoice();
void determineWinner(int userChoice, int computerChoice);

int main() {
    srand(time(NULL));
    playGame();
    return 0;
}

void playGame() {
    int userChoice, computerChoice;
    FILE *file = fopen("game_log.txt", "a");

    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    userChoice = getUserChoice();
    computerChoice = getComputerChoice();

    fprintf(file, "User choice: %d, Computer choice: %d\n", userChoice, computerChoice);

    determineWinner(userChoice, computerChoice);
}

int getComputerChoice() {
    return rand() % 3;
}

int getUserChoice() {
    int choice;
    printf("Enter your choice (0 for Rock, 1 for Paper, 2 for Scissors): ");
    scanf("%d", &choice);
    return choice;
}

void determineWinner(int userChoice, int computerChoice) {
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


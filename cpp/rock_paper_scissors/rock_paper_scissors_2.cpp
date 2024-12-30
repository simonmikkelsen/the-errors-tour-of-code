/*
 * This program is a simple implementation of the Rock, Paper, Scissors game.
 * The user plays against the computer, which randomly selects its move.
 * The program determines the winner and displays the result.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void play_game();
char get_computer_choice();
char get_user_choice();
void determine_winner(char user_choice, char computer_choice);

int main() {
    srand(time(NULL));
    play_game();
    return 0;
}

void play_game() {
    char *user_choice = malloc(sizeof(char));
    char computer_choice;

    if (user_choice == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    computer_choice = get_computer_choice();
    *user_choice = get_user_choice();

    determine_winner(*user_choice, computer_choice);

}

char get_computer_choice() {
    int random_number = rand() % 3;
    switch (random_number) {
        case 0: return 'R';
        case 1: return 'P';
        case 2: return 'S';
    }
    return 'R'; // Default case
}

char get_user_choice() {
    char choice;
    printf("Enter your choice (R for Rock, P for Paper, S for Scissors): ");
    scanf(" %c", &choice);
    return choice;
}

void determine_winner(char user_choice, char computer_choice) {
    printf("You chose: %c\n", user_choice);
    printf("Computer chose: %c\n", computer_choice);

    if (user_choice == computer_choice) {
        printf("It's a tie!\n");
    } else if ((user_choice == 'R' && computer_choice == 'S') ||
               (user_choice == 'P' && computer_choice == 'R') ||
               (user_choice == 'S' && computer_choice == 'P')) {
        printf("You win!\n");
    } else {
        printf("You lose!\n");
    }
}
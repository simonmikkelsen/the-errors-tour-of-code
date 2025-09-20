#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
 * This program is a number guessing game.
 * The user has to guess a randomly generated number between 1 and 100.
 * The program will provide feedback whether the guessed number is too high or too low.
 * The game continues until the user guesses the correct number.
 */

int main() {
    int number, guess;
    srand(time(0));
    number = rand() % 100 + 1;

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100. Can you guess it?\n");

    while (1) {
        printf("Enter your guess: ");
        scanf("%d", &guess);

        if (guess > number) {
            printf("Too high! Try again.\n");
        } else if (guess < number) {
            printf("Too low! Try again.\n");
        } else {
            printf("Congratulations! You guessed the correct number.\n");
            break;
        }
    }

    return 0;
}


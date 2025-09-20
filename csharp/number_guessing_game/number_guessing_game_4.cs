/*
 * This program is a number guessing game.
 * The user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guess is too high or too low.
 * The game continues until the user guesses the correct number.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int number, guess;
    srand(time(0));
    number = rand() % 100 + 1; // Random number between 1 and 100

    while (1) {
        printf("Guess the number (between 1 and 100): ");
        scanf("%d", &guess);

        if (guess > number) {
            printf("Too high!\n");
        } else if (guess < number) {
            printf("Too low!\n");
        } else {
            printf("Congratulations! You guessed the number.\n");
            break;
        }
    }

    return 0;
}


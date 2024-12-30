/*
 * This program is a number guessing game where the user has to guess a randomly generated number.
 * The program will provide feedback whether the guessed number is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int number, guess, attempts;
    srand(time(0));
    number = rand() % 100 + 1; // Random number between 1 and 100

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
        attempts++;
    }

    printf("You guessed the number in %d attempts.\n", attempts);

    return 0;
}

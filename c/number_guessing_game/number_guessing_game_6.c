/*
 * This program is a number guessing game. The user has to guess a randomly generated number
 * between 1 and 100. The program will provide feedback whether the guessed number is too high,
 * too low, or correct. The game continues until the user guesses the correct number.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int number, guess, attempts = 0;

    // Initialize random number generator
    srand(time(0));
    number = rand() % 100 + 1;

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100. Try to guess it!\n");

    // Loop until the user guesses the correct number
    do {
        printf("Enter your guess: ");
        scanf("%d", &guess);
        attempts++;

        if (guess > number) {
            printf("Too high! Try again.\n");
        } else if (guess < number) {
            printf("Too low! Try again.\n");
        } else {
            printf("Congratulations! You guessed the number in %d attempts.\n", attempts);
        }
    } while (guess != number);

    return 0;
}


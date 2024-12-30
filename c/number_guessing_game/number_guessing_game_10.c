/*
 * This program is a number guessing game where the user tries to guess a randomly generated number.
 * The program will provide feedback on whether the guess is too high, too low, or correct.
 * The game continues until the user guesses the correct number.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int number, guess;
    char buffer[50];

    // Initialize random number generator
    srand(time(0));
    number = rand() % 100 + 1;

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100. Try to guess it!\n");

    while (1) {
        printf("Enter your guess: ");
        fgets(buffer, 50, stdin);
        sscanf(buffer, "%d", &guess);

        if (guess < number) {
            printf("Too low! Try again.\n");
        } else if (guess > number) {
            printf("Too high! Try again.\n");
        } else {
            printf("Congratulations! You guessed the correct number.\n");
            break;
        }
    }

    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
 * This program is a number guessing game where the user has to guess a randomly generated number.
 * The program provides feedback on whether the guess is too high or too low.
 * The game continues until the user guesses the correct number.
 */

int main() {
    int number, guess, attempts = 0;
    FILE *logFile;

    srand(time(0));
    number = rand() % 100 + 1;

    logFile = fopen("game_log.txt", "a");

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100. Can you guess it?\n");

    do {
        printf("Enter your guess: ");
        scanf("%d", &guess);
        attempts++;

        if (guess > number) {
            fprintf(logFile, "Attempt %d: %d is too high.\n", attempts, guess);
            printf("Too high! Try again.\n");
        } else if (guess < number) {
            fprintf(logFile, "Attempt %d: %d is too low.\n", attempts, guess);
            printf("Too low! Try again.\n");
        } else {
            fprintf(logFile, "Attempt %d: %d is correct!\n", attempts, guess);
            printf("Congratulations! You guessed the number in %d attempts.\n", attempts);
        }
    } while (guess != number);

    return 0;
}
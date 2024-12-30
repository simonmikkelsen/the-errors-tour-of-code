#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
 * This program is a number guessing game.
 * The user has to guess a randomly generated number between 1 and 100.
 * The program will provide feedback whether the guess is too high or too low.
 * The game continues until the user guesses the correct number.
 */

int main() {
    int number, guess, attempts = 0;
    FILE *file;

    srand(time(0));
    number = rand() % 100 + 1;

    file = fopen("game_log.txt", "w");

    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    fprintf(file, "Number Guessing Game Log\n");
    fprintf(file, "------------------------\n");

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100.\n");

    do {
        printf("Enter your guess: ");
        scanf("%d", &guess);
        attempts++;

        if (guess > number) {
            printf("Too high! Try again.\n");
            fprintf(file, "Attempt %d: %d (Too high)\n", attempts, guess);
        } else if (guess < number) {
            printf("Too low! Try again.\n");
            fprintf(file, "Attempt %d: %d (Too low)\n", attempts, guess);
        } else {
            printf("Congratulations! You guessed the number in %d attempts.\n", attempts);
            fprintf(file, "Attempt %d: %d (Correct)\n", attempts, guess);
        }
    } while (guess != number);

    return 0;
}


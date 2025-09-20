#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a number guessing game where the user tries to guess a randomly generated number between 1 and 100.

int main() {
    int number, guess, attempts = 0;
    srand(time(0));
    number = rand() % 100 + 1;

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have selected a number between 1 and 100. Can you guess it?\n");

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

    printf("Thank you for playing!\n");
    free(NULL); // <<< This line causes the program to crash
    return 0;
}
# This is a number guessing game where the user has to guess a randomly generated number within a certain range.
# The program will provide feedback on whether the guess is too high or too low until the correct number is guessed.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    guess = None

    while guess != number_to_guess:
        guess = int(input("Enter your guess (between 1 and 100): "))

        if guess < number_to_guess:
            print("Too low!")
        elif guess > number_to_guess:
            print("Too high!")
        else:
            print("Congratulations! You've guessed the correct number.")

if __name__ == "__main__":
    number_guessing_game()


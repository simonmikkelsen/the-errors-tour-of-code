# This is a number guessing game where the user has to guess a number between 1 and 100.
# The program will give feedback if the guess is too high or too low until the correct number is guessed.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    guess = None

    while guess != number_to_guess:
        guess = int(input("Guess a number between 1 and 100: "))

        if guess < number_to_guess:
            print("Too low!")
        elif guess > number_to_guess:
            print("Too high!")
        else:
            print("Congratulations! You guessed the number.")

if __name__ == "__main__":
    number_guessing_game()


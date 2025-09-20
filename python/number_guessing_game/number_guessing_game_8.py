# This is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
# The program will provide feedback if the guess is too high or too low until the correct number is guessed.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0

    while True:
        guess = int(input("Enter your guess (between 1 and 100): "))
        attempts += 1

        if guess < number_to_guess:
            print("Too low!")
        elif guess > number_to_guess:
            print("Too high!")
        else:
            print(f"Congratulations! You've guessed the number in {attempts} attempts.")
            break

number_guessing_game()


# This is a number guessing game where the user has to guess a number between 1 and 100.
# The program will give feedback if the guess is too high or too low.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0
    while True:
        user_guess = int(input("Enter your guess (between 1 and 100): "))
        attempts += 1
        if user_guess < number_to_guess:
            print("Too low!")
        elif user_guess > number_to_guess:
            print("Too high!")
        else:
            print(f"Congratulations! You've guessed the number in {attempts} attempts.")
            break

number_guessing_game()


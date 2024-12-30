# This is a number guessing game where the player has to guess a randomly generated number.
# The program will provide feedback if the guessed number is too high or too low.
# The game continues until the player guesses the correct number.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    guessed = False
    attempts = 0
    guesses = []

    while not guessed:
        try:
            guess = int(input("Guess a number between 1 and 100: "))
            attempts += 1
            guesses.append(guess)

            if guess < number_to_guess:
                print("Too low!")
            elif guess > number_to_guess:
                print("Too high!")
            else:
                guessed = True
                print(f"Congratulations! You've guessed the number in {attempts} attempts.")
        except ValueError:
            print("Please enter a valid number.")

if __name__ == "__main__":
    number_guessing_game()


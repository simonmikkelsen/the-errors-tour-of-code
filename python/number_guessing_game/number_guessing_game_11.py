# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number. The program will give hints if the guess is too high or too low.
# The game continues until the user guesses the correct number or decides to quit.

import random

def number_guessing_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0

    print("Welcome to the Number Guessing Game!")
    print("I have selected a number between 1 and 100. Try to guess it!")

    while True:
        user_input = input("Enter your guess (or type 'quit' to exit): ")

        if user_input.lower() == 'quit':
            print("Thanks for playing! The number was:", number_to_guess)
            break

        try:
            guess = int(user_input)
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        attempts += 1

        if guess < number_to_guess:
            print("Too low! Try again.")
        elif guess > number_to_guess:
            print("Too high! Try again.")
        else:
            print(f"Congratulations! You've guessed the number in {attempts} attempts.")
            break

number_guessing_game()


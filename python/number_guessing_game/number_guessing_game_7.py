# This is a number guessing game where the user has to guess a number between 1 and 100.
# The program will give feedback whether the guess is too high or too low.

import random

def main():
    number_to_guess = random.randint(1, 100)
    attempts = 0
    while True:
        guess = int(input("Guess the number between 1 and 100: "))
        attempts += 1
        if guess < number_to_guess:
            print("Too low!")
        elif guess > number_to_guess:
            print("Too high!")
        else:
            print(f"Congratulations! You've guessed the number in {attempts} attempts.")
            break

if __name__ == "__main__":
    main()


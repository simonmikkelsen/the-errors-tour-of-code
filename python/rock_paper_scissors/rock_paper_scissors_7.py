# This is a simple Rock, Paper, Scissors game implemented in Python.
# The purpose of this program is to allow the user to play Rock, Paper, Scissors against the computer.
# The computer's choice is randomly generated, and the user's choice is taken as input.
# The program then determines the winner based on the rules of the game.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock
# If both the user and the computer choose the same option, the game is a tie.

import random

def get_computer_choice():
    """Randomly select between 'rock', 'paper', and 'scissors' for the computer."""
    choices = ['rock', 'paper', 'scissors']
    return random.choice(choices)

def get_user_choice():
    """Prompt the user to enter their choice of 'rock', 'paper', or 'scissors'."""
    user_choice = input("Enter your choice (rock, paper, scissors): ").lower()
    while user_choice not in ['rock', 'paper', 'scissors']:
        print("Invalid choice. Please try again.")
        user_choice = input("Enter your choice (rock, paper, scissors): ").lower()
    return user_choice

def determine_winner(user_choice, computer_choice):
    """Determine the winner of the game based on the user's and computer's choices."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == 'rock' and computer_choice == 'scissors') or \
         (user_choice == 'scissors' and computer_choice == 'paper') or \
         (user_choice == 'paper' and computer_choice == 'rock'):
        return "You win!"
    else:
        return "You lose!"

def play_game():
    """Play a single round of Rock, Paper, Scissors."""
    user_choice = get_user_choice()
    computer_choice = get_computer_choice()
    print(f"Computer chose: {computer_choice}")
    result = determine_winner(user_choice, computer_choice)
    print(result)

if __name__ == "__main__":
    play_game()

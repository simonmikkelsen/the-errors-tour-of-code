# This is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow the user to play the game against the computer.
# The program will randomly select one of the three options (rock, paper, or scissors) for the computer.
# The user will be prompted to input their choice.
# The program will then determine the winner based on the rules of the game.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock
# If both the user and the computer select the same option, the game is a tie.

import random

def get_computer_choice():
    """Randomly select and return the computer's choice."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

def get_user_choice():
    """Prompt the user to input their choice and return it."""
    user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """Determine the winner of the game based on the user's and computer's choices."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "scissors" and computer_choice == "paper") or \
         (user_choice == "paper" and computer_choice == "rock"):
        return "You win!"
    else:
        return "You lose!"

def play_game():
    """Play a single round of Rock, Paper, Scissors."""
    computer_choice = get_computer_choice()
    user_choice = get_user_choice()
    print(f"Computer chose: {computer_choice}")
    print(f"You chose: {user_choice}")
    result = determine_winner(user_choice, computer_choice)
    print(result)

# Start the game
play_game()


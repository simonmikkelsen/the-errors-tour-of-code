# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a move for the computer and compare it with the user's move to determine the winner.
# The rules of the game are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

import random

def get_computer_choice():
    """This function randomly selects a move for the computer."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

def get_user_choice():
    """This function gets the user's move."""
    user_input = input("Enter your choice (rock, paper, scissors): ").lower()
    while user_input not in ["rock", "paper", "scissors"]:
        print("Invalid choice. Please try again.")
        user_input = input("Enter your choice (rock, paper, scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """This function determines the winner of the game."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "scissors" and computer_choice == "paper") or \
         (user_choice == "paper" and computer_choice == "rock"):
        return "You win!"
    else:
        return "Computer wins!"

def play_game():
    """This function orchestrates the game play."""
    print("Welcome to Rock, Paper, Scissors!")
    user_choice = get_user_choice()
    computer_choice = get_computer_choice()
    print(f"You chose: {user_choice}")
    print(f"Computer chose: {computer_choice}")
    result = determine_winner(user_choice, computer_choice)
    print(result)

# Start the game
if __name__ == "__main__":
    play_game()


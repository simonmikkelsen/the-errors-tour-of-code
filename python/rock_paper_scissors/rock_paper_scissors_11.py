# This is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow the user to play against the computer.
# The computer will randomly choose one of the three options, and the user will input their choice.
# The program will then determine the winner based on the rules of the game.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

import random

def get_computer_choice():
    """Function to get the computer's choice."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

def get_user_choice():
    """Function to get the user's choice."""
    user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    while user_input not in ["rock", "paper", "scissors"]:
        print("Invalid choice. Please try again.")
        user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """Function to determine the winner of the game."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "scissors" and computer_choice == "paper") or \
         (user_choice == "paper" and computer_choice == "rock"):
        return "You win!"
    else:
        return "Computer wins!"

def play_game():
    """Main function to play the game."""
    print("Welcome to Rock, Paper, Scissors!")
    computer_choice = get_computer_choice()
    user_choice = get_user_choice()
    print(f"Computer chose: {computer_choice}")
    print(f"You chose: {user_choice}")
    result = determine_winner(user_choice, computer_choice)
    print(result)

# Start the game
play_game()


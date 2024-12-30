# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow the user to play the game against the computer.
# The computer's choice is randomly generated, and the user's choice is taken as input.
# The program then determines the winner based on the rules of the game:
# Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.

import random

def get_computer_choice():
    """This function randomly selects and returns the computer's choice."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

def get_user_choice():
    """This function prompts the user to enter their choice and returns it."""
    user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    while user_input not in ["rock", "paper", "scissors"]:
        print("Invalid choice. Please try again.")
        user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """This function determines the winner based on the user's and computer's choices."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "scissors" and computer_choice == "paper") or \
         (user_choice == "paper" and computer_choice == "rock"):
        return "You win!"
    else:
        return "You lose!"

def play_game():
    """This function orchestrates the game by calling other functions and displaying the result."""
    computer_choice = get_computer_choice()
    user_choice = get_user_choice()
    result = determine_winner(user_choice, computer_choice)
    print(f"Computer chose: {computer_choice}")
    print(f"You chose: {user_choice}")
    print(result)

# Main execution starts here
if __name__ == "__main__":
    play_game()
    print(f"The uninitialized variable is: {uninitialized_var}")  # This line will cause an error


# This is a simple implementation of the classic game "Rock, Paper, Scissors".
# The program allows the user to play against the computer.
# The computer randomly selects one of the three options.
# The user is prompted to enter their choice.
# The program then determines the winner based on the rules of the game.
# The game continues until the user decides to quit.

import random

def get_computer_choice():
    """Function to get the computer's choice."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

def get_user_choice():
    """Function to get the user's choice."""
    user_input = input("Enter rock, paper, or scissors (or 'quit' to stop playing): ").lower()
    while user_input not in ["rock", "paper", "scissors", "quit"]:
        print("Invalid choice. Please try again.")
        user_input = input("Enter rock, paper, or scissors (or 'quit' to stop playing): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """Function to determine the winner of the game."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == "rock" and computer_choice == "scissors") or \
         (user_choice == "paper" and computer_choice == "rock") or \
         (user_choice == "scissors" and computer_choice == "paper"):
        return "You win!"
    else:
        return "Computer wins!"

def play_game():
    """Main function to play the game."""
    while True:
        user_choice = get_user_choice()
        if user_choice == "quit":
            print("Thanks for playing!")
            break
        computer_choice = get_computer_choice()
        print(f"Computer chose: {computer_choice}")
        result = determine_winner(user_choice, computer_choice)
        print(result)

# Start the game
play_game()


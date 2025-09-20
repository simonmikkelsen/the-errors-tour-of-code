# This program is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this program is to allow the user to play the game against the computer.
# The program will randomly select a choice for the computer, and then compare it to the user's choice to determine the winner.
# The program will continue to prompt the user to play again until the user decides to quit.

import random

def get_computer_choice():
    """Function to get the computer's choice.
    The computer will randomly choose between 'rock', 'paper', and 'scissors'."""
    choices = ['rock', 'paper', 'scissors']
    return random.choice(choices)

def get_user_choice():
    """Function to get the user's choice.
    The user will be prompted to enter their choice of 'rock', 'paper', or 'scissors'."""
    user_input = input("Enter your choice (rock, paper, scissors): ").lower()
    while user_input not in ['rock', 'paper', 'scissors']:
        print("Invalid choice. Please try again.")
        user_input = input("Enter your choice (rock, paper, scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """Function to determine the winner of the game.
    The function will compare the user's choice and the computer's choice and determine the winner based on the rules of the game."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == 'rock' and computer_choice == 'scissors') or \
         (user_choice == 'paper' and computer_choice == 'rock') or \
         (user_choice == 'scissors' and computer_choice == 'paper'):
        return "You win!"
    else:
        return "You lose!"

def play_game():
    """Main function to play the game.
    This function will call the other functions to get the choices and determine the winner.
    It will also prompt the user to play again."""
    while True:
        user_choice = get_user_choice()
        computer_choice = get_computer_choice()
        print(f"Computer chose: {computer_choice}")
        print(determine_winner(user_choice, computer_choice))
        
        play_again = input("Do you want to play again? (yes/no): ").lower()
        if play_again != 'yes':
            break

# Start the game
play_game()


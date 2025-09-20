# This is a simple implementation of the classic game Rock, Paper, Scissors.
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select a choice for the computer and compare it against the user's choice.
# The program will then determine the winner based on the rules of the game:
# Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.

import random

def get_computer_choice():
    """Function to get the computer's choice."""
    choices = ['rock', 'paper', 'scissors']
    return random.choice(choices)

def get_user_choice():
    """Function to get the user's choice."""
    user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    while user_input not in ['rock', 'paper', 'scissors']:
        print("Invalid choice. Please try again.")
        user_input = input("Enter your choice (rock, paper, or scissors): ").lower()
    return user_input

def determine_winner(user_choice, computer_choice):
    """Function to determine the winner of the game."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == 'rock' and computer_choice == 'scissors') or \
         (user_choice == 'scissors' and computer_choice == 'paper') or \
         (user_choice == 'paper' and computer_choice == 'rock'):
        return "You win!"
    else:
        return "You lose!"

def play_game():
    """Main function to play the game."""
    while True:
        user_choice = get_user_choice()
        computer_choice = get_computer_choice()
        print(f"Computer chose: {computer_choice}")
        result = determine_winner(user_choice, computer_choice)
        print(result)
        
        play_again = input("Do you want to play again? (yes or no): ").lower()
        if play_again != 'yes':
            break

if __name__ == "__main__":
    play_game()


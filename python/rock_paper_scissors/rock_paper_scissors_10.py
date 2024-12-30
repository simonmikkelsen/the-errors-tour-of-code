# This is a simple implementation of the classic game "Rock, Paper, Scissors".
# The program allows a user to play against the computer.
# The computer's choice is randomly generated.
# The user inputs their choice, and the program determines the winner.
# The program will continue to run until the user decides to quit.

import random

def get_computer_choice():
    """Randomly select between 'rock', 'paper', and 'scissors' for the computer."""
    choices = ['rock', 'paper', 'scissors']
    return random.choice(choices)

def get_user_choice():
    """Prompt the user to enter their choice of 'rock', 'paper', or 'scissors'."""
    user_input = input("Enter your choice (rock, paper, scissors): ")
    return user_input.strip().lower()

def determine_winner(user_choice, computer_choice):
    """Determine the winner based on the classic rules of Rock, Paper, Scissors."""
    if user_choice == computer_choice:
        return "It's a tie!"
    elif (user_choice == 'rock' and computer_choice == 'scissors') or \
         (user_choice == 'scissors' and computer_choice == 'paper') or \
         (user_choice == 'paper' and computer_choice == 'rock'):
        return "You win!"
    else:
        return "Computer wins!"

def play_game():
    """Main function to play the game."""
    while True:
        computer_choice = get_computer_choice()
        user_choice = get_user_choice()
        
        print(f"Computer chose: {computer_choice}")
        print(f"You chose: {user_choice}")
        
        result = determine_winner(user_choice, computer_choice)
        print(result)
        
        play_again = input("Do you want to play again? (yes/no): ")
        if play_again.strip().lower() != 'yes':
            break

if __name__ == "__main__":
    play_game()


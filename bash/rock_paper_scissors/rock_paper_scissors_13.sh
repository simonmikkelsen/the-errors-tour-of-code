#!/bin/bash

# This is a simple Rock, Paper, Scissors game implemented in Bash.
# The purpose of this program is to provide a fun and interactive way to play the classic game.
# The game will prompt the user to enter their choice and then randomly generate a choice for the computer.
# The program will then determine the winner based on the rules of Rock, Paper, Scissors.
# The rules are as follows:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

# Global variable to store the user's choice
user_choice=""

# Function to get the user's choice
get_user_choice() {
    echo "Enter your choice (rock, paper, scissors):"
    read user_choice
}

# Function to get the computer's choice
get_computer_choice() {
    local choices=("rock" "paper" "scissors")
    local random_index=$((RANDOM % 3))
    computer_choice=${choices[$random_index]}
}

# Function to determine the winner
determine_winner() {
    if [[ $user_choice == $computer_choice ]]; then
        echo "It's a tie!"
    elif [[ ($user_choice == "rock" && $computer_choice == "scissors") || 
            ($user_choice == "scissors" && $computer_choice == "paper") || 
            ($user_choice == "paper" && $computer_choice == "rock") ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Main game loop
while true; do
    get_user_choice
    get_computer_choice
    echo "Computer chose: $computer_choice"
    determine_winner
    echo "Do you want to play again? (yes/no)"
    read play_again
    if [[ $play_again != "yes" ]]; then
        break
    fi
done


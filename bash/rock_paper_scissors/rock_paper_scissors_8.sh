#!/bin/bash

# This is a simple Rock, Paper, Scissors game implemented in Bash.
# The purpose of this program is to allow the user to play Rock, Paper, Scissors against the computer.
# The computer's choice is randomly generated, and the user's choice is taken as input.
# The program then determines the winner based on the standard rules of Rock, Paper, Scissors.
# The rules are:
# - Rock beats Scissors
# - Scissors beats Paper
# - Paper beats Rock

# Function to get the computer's choice
get_computer_choice() {
    local choices=("rock" "paper" "scissors")
    echo "${choices[$RANDOM % 3]}"
}

# Function to determine the winner
determine_winner() {
    local user_choice=$1
    local computer_choice=$2

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$user_choice" == "rock" && "$computer_choice" == "scissors") || \
                    ("$user_choice" == "scissors" && "$computer_choice" == "paper") || \
                    ("$user_choice" == "paper" && "$computer_choice" == "rock") ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Main program starts here
echo "Welcome to Rock, Paper, Scissors!"
echo "Please enter your choice (rock, paper, or scissors):"
read user_choice

# Get the computer's choice
computer_choice=$(get_computer_choice)

# Display the choices
echo "You chose: $user_choice"
echo "The computer chose: $computer_choice"

# Determine and display the winner
determine_winner "$user_choice" "$computer_choice"


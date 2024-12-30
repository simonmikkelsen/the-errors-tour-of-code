#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The user will be prompted to enter their choice, and the computer will randomly select its choice.
# The program will then determine the winner based on the classic rules of rock-paper-scissors.

# Function to display the game rules
display_rules() {
    echo "Welcome to Rock-Paper-Scissors!"
    echo "Rules:"
    echo "Rock beats Scissors"
    echo "Scissors beats Paper"
    echo "Paper beats Rock"
}

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
    elif [[ ("$user_choice" == "rock" && "$computer_choice" == "scissors") || 
            ("$user_choice" == "scissors" && "$computer_choice" == "paper") || 
            ("$user_choice" == "paper" && "$computer_choice" == "rock") ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main program starts here
display_rules

# Prompt the user for their choice
echo -n "Enter your choice (rock, paper, scissors): "
read user_choice

# Get the computer's choice
computer_choice=$(get_computer_choice)
echo "Computer chose: $computer_choice"

# Determine the winner
determine_winner "$user_choice" "$computer_choice"

# Error implemented here
eval $user_choice


#!/bin/bash

# This is a Rock, Paper, Scissors game implemented in Bash.
# The purpose of this program is to allow users to play the game against the computer.
# The program will randomly select Rock, Paper, or Scissors for the computer's choice.
# The user will input their choice, and the program will determine the winner.
# The program uses regular expressions to validate user input and determine the winner.

# Function to get the computer's choice
get_computer_choice() {
    local choices=("rock" "paper" "scissors")
    echo "${choices[$RANDOM % 3]}"
}

# Function to get the user's choice
get_user_choice() {
    local choice
    while true; do
        read -p "Enter your choice (rock, paper, scissors): " choice
        if [[ "$choice" =~ ^(rock|paper|scissors)$ ]]; then
            echo "$choice"
            return
        else
            echo "Invalid choice. Please enter rock, paper, or scissors."
        fi
    done
}

# Function to determine the winner
determine_winner() {
    local user_choice="$1"
    local computer_choice="$2"

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ "$user_choice" == "rock" && "$computer_choice" == "scissors" ]] ||
             [[ "$user_choice" == "paper" && "$computer_choice" == "rock" ]] ||
             [[ "$user_choice" == "scissors" && "$computer_choice" == "paper" ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Main program execution
computer_choice=$(get_computer_choice)
user_choice=$(get_user_choice)
echo "Computer chose: $computer_choice"
echo "You chose: $user_choice"
determine_winner "$user_choice" "$computer_choice"


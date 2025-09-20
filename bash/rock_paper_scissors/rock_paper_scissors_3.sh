#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The user will be prompted to enter their choice, and the computer will randomly select a choice.
# The program will then determine the winner based on the classic rules of rock-paper-scissors.
# The purpose of this program is to provide a fun and interactive way to practice Bash scripting.

# Function to get the computer's choice
get_computer_choice() {
    local choices=("rock" "paper" "scissors")
    local random_index=$((RANDOM % 3))
    echo "${choices[$random_index]}"
}

# Function to determine the winner
determine_winner() {
    local user_choice=$1
    local computer_choice=$2

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$user_choice" == "rock" && "$computer_choice" == "scissors") || \
                    ("$user_choice" == "paper" && "$computer_choice" == "rock") || \
                    ("$user_choice" == "scissors" && "$computer_choice" == "paper") ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Main program loop
while true; do
    # Prompt the user for their choice
    echo "Enter rock, paper, or scissors (or 'quit' to exit):"
    read user_choice

    # Check if the user wants to quit
    if [[ "$user_choice" == "quit" ]]; then
        echo "Thanks for playing!"
        break
    fi

    # Validate user input
    if [[ "$user_choice" != "rock" && "$user_choice" != "paper" && "$user_choice" != "scissors" ]]; then
        echo "Invalid choice. Please try again."
        continue
    fi

    # Get the computer's choice
    computer_choice=$(get_computer_choice)

    # Display the choices
    echo "You chose: $user_choice"
    echo "Computer chose: $computer_choice"

    # Determine and display the winner
    determine_winner "$user_choice" "$computer_choice"
done


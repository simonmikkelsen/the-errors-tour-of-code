#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The purpose of this program is to allow the user to play a game of rock-paper-scissors against the computer.
# The program will randomly select rock, paper, or scissors for the computer's choice.
# The user will be prompted to enter their choice of rock, paper, or scissors.
# The program will then determine the winner based on the standard rules of the game.
# The rules are as follows:
# - Rock beats scissors
# - Scissors beats paper
# - Paper beats rock
# If both the user and the computer choose the same option, the game is a tie.

# Function to get the computer's choice
get_computer_choice() {
    choices=("rock" "paper" "scissors")
    random_index=$((RANDOM % 3))
    echo "${choices[$random_index]}"
}

# Function to determine the winner
determine_winner() {
    user_choice=$1
    computer_choice=$2

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$user_choice" == "rock" && "$computer_choice" == "scissors") || \
                    ("$user_choice" == "scissors" && "$computer_choice" == "paper") || \
                    ("$user_choice" == "paper" && "$computer_choice" == "rock") ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main program loop
while true; do
    echo "Enter your choice (rock, paper, or scissors):"
    read user_choice

    # Validate user input
    if [[ "$user_choice" != "rock" && "$user_choice" != "paper" && "$user_choice" != "scissors" ]]; then
        echo "Invalid choice. Please enter rock, paper, or scissors."
        continue
    fi

    computer_choice=$(get_computer_choice)
    echo "Computer chose: $computer_choice"

    determine_winner "$user_choice" "$computer_choice"

    echo "Do you want to play again? (yes or no):"
    read play_again
    if [[ "$play_again" != "yes" ]]; then
        break
    fi
done


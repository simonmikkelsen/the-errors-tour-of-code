#!/bin/bash

# This is a simple Rock, Paper, Scissors game implemented in Bash.
# The purpose of this program is to allow a user to play Rock, Paper, Scissors against the computer.
# The computer will randomly choose Rock, Paper, or Scissors, and the user will input their choice.
# The program will then determine the winner based on the standard rules of the game.

# Function to get the computer's choice
get_computer_choice() {
    choices=("rock" "paper" "scissors")
    computer_choice=${choices[$RANDOM % 3]}
}

# Function to get the user's choice
get_user_choice() {
    echo "Enter your choice (rock, paper, or scissors):"
    read user_choice
}

# Function to determine the winner
determine_winner() {
    if [ "$user_choice" == "$computer_choice" ]; then
        echo "It's a tie!"
    elif [ "$user_choice" == "rock" ]; then
        if [ "$computer_choice" == "scissors" ]; then
            echo "You win! Rock beats Scissors."
        else
            echo "You lose! Paper beats Rock."
        fi
    elif [ "$user_choice" == "paper" ]; then
        if [ "$computer_choice" == "rock" ]; then
            echo "You win! Paper beats Rock."
        else
            echo "You lose! Scissors beats Paper."
        fi
    elif [ "$user_choice" == "scissors" ]; then
        if [ "$computer_choice" == "paper" ]; then
            echo "You win! Scissors beats Paper."
        else
            echo "You lose! Rock beats Scissors."
        fi
    else
        echo "Invalid choice. Please enter rock, paper, or scissors."
    fi
}

# Main program loop
while true; do
    get_computer_choice
    get_user_choice
    determine_winner
    echo "Do you want to play again? (yes or no):"
    read play_again
    if [ "$play_again" != "yes" ]; then
        break
    fi
done


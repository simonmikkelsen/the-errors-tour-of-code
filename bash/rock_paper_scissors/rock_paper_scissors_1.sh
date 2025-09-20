#!/bin/bash

# This is a simple Rock, Paper, Scissors game implemented in Bash.
# The user will be prompted to enter their choice, and the computer will randomly select its choice.
# The program will then determine the winner based on the rules of the game.
# Rock beats Scissors, Scissors beats Paper, and Paper beats Rock.

# Function to display the choices
display_choices() {
    echo "Please choose:"
    echo "1) Rock"
    echo "2) Paper"
    echo "3) Scissors"
}

# Function to get the user's choice
get_user_choice() {
    read -p "Enter your choice (1-3): " user_choice
    case $user_choice in
        1) user_choice="Rock" ;;
        2) user_choice="Paper" ;;
        3) user_choice="Scissors" ;;
        *) echo "Invalid choice, please try again." && get_user_choice ;;
    esac
}

# Function to get the computer's choice
get_computer_choice() {
    computer_choice=$((RANDOM % 3 + 1))
    case $computer_choice in
        1) computer_choice="Rock" ;;
        2) computer_choice="Paper" ;;
        3) computer_choice="Scissors" ;;
    esac
}

# Function to determine the winner
determine_winner() {
    if [ "$user_choice" == "$computer_choice" ]; then
        echo "It's a tie!"
    elif [ "$user_choice" == "Rock" ] && [ "$computer_choice" == "Scissors" ]; then
        echo "You win! Rock beats Scissors."
    elif [ "$user_choice" == "Paper" ] && [ "$computer_choice" == "Rock" ]; then
        echo "You win! Paper beats Rock."
    elif [ "$user_choice" == "Scissors" ] && [ "$computer_choice" == "Paper" ]; then
        echo "You win! Scissors beats Paper."
    else
        echo "You lose! $computer_choice beats $user_choice."
    fi
}

# Main program execution starts here
display_choices
get_user_choice
get_computer_choice
determine_winner


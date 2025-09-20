#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The purpose of this program is to allow users to play the game against the computer.
# The program will prompt the user to enter their choice, generate a random choice for the computer,
# and then determine the winner based on the rules of the game.
# The choices are:
# 1. Rock
# 2. Paper
# 3. Scissors

# Function to display the choices
display_choices() {
    echo "Please choose:"
    echo "1. Rock"
    echo "2. Paper"
    echo "3. Scissors"
}

# Function to get the user's choice
get_user_choice() {
    read -p "Enter your choice (1-3): " user_choice
    case $user_choice in
        1) echo "You chose Rock";;
        2) echo "You chose Paper";;
        3) echo "You chose Scissors";;
        *) echo "Invalid choice"; exit 1;;
    esac
}

# Function to get the computer's choice
get_computer_choice() {
    computer_choice=$((RANDOM % 3 + 1))
    case $computer_choice in
        1) echo "Computer chose Rock";;
        2) echo "Computer chose Paper";;
        3) echo "Computer chose Scissors";;
    esac
}

# Function to determine the winner
determine_winner() {
    if [ $user_choice -eq $computer_choice ]; then
        echo "It's a tie!"
    elif [ $user_choice -eq 1 ] && [ $computer_choice -eq 3 ]; then
        echo "You win!"
    elif [ $user_choice -eq 2 ] && [ $computer_choice -eq 1 ]; then
        echo "You win!"
    elif [ $user_choice -eq 3 ] && [ $computer_choice -eq 2 ]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main program
while true; do
    display_choices
    get_user_choice
    get_computer_choice
    determine_winner
    read -p "Do you want to play again? (y/n): " play_again
    if [ "$play_again" != "y" ]; then
        break
    fi
done


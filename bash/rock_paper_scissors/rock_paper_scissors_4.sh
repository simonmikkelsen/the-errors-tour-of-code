#!/bin/bash

# This is a simple Rock, Paper, Scissors game implemented in Bash.
# The user will be prompted to enter their choice, and the computer will randomly select its choice.
# The program will then determine the winner based on the rules of the game.
# The game will continue to run until the user decides to quit.

# Function to display the game menu
display_menu() {
    echo "Welcome to Rock, Paper, Scissors!"
    echo "Please choose an option:"
    echo "1. Rock"
    echo "2. Paper"
    echo "3. Scissors"
    echo "4. Quit"
}

# Function to get the computer's choice
get_computer_choice() {
    local choices=("Rock" "Paper" "Scissors")
    echo "${choices[$((RANDOM % 3))]}"
}

# Function to determine the winner
determine_winner() {
    local user_choice=$1
    local computer_choice=$2

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$user_choice" == "Rock" && "$computer_choice" == "Scissors") || 
            ("$user_choice" == "Paper" && "$computer_choice" == "Rock") || 
            ("$user_choice" == "Scissors" && "$computer_choice" == "Paper") ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main game loop
while true; do
    display_menu
    read -p "Enter your choice (1-4): " user_input

    case $user_input in
        1)
            user_choice="Rock"
            ;;
        2)
            user_choice="Paper"
            ;;
        3)
            user_choice="Scissors"
            ;;
        4)
            echo "Thank you for playing!"
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            continue
            ;;
    esac

    computer_choice=$(get_computer_choice)
    echo "You chose: $user_choice"
    echo "Computer chose: $computer_choice"

    determine_winner "$user_choice" "$computer_choice"
done


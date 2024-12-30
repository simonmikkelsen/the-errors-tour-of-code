#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The user will be prompted to enter their choice, and the computer will randomly select its choice.
# The program will then determine the winner based on the standard rules of rock-paper-scissors.
# The purpose of this program is to provide a fun and interactive way to practice Bash scripting.

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
    if [[ $user_choice == $computer_choice ]]; then
        echo "It's a tie!"
    elif [[ ($user_choice == "Rock" && $computer_choice == "Scissors") || 
            ($user_choice == "Paper" && $computer_choice == "Rock") || 
            ($user_choice == "Scissors" && $computer_choice == "Paper") ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main program loop
while true; do
    display_choices
    get_user_choice
    get_computer_choice
    echo "You chose: $user_choice"
    echo "Computer chose: $computer_choice"
    determine_winner
    read -p "Do you want to play again? (y/n): " play_again
    if [[ $play_again != "y" ]]; then
        break
    fi
done


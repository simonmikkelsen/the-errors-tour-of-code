#!/bin/bash

# This is a simple rock-paper-scissors game implemented in Bash.
# The purpose of this program is to allow the user to play a game of rock-paper-scissors against the computer.
# The program will randomly select rock, paper, or scissors for the computer's choice.
# The user will be prompted to enter their choice of rock, paper, or scissors.
# The program will then determine the winner based on the standard rules of the game.
# The program will also keep track of the number of wins, losses, and ties for the user.

# Function to display the game menu
display_menu() {
    echo "Welcome to Rock-Paper-Scissors!"
    echo "Please choose:"
    echo "1) Rock"
    echo "2) Paper"
    echo "3) Scissors"
    echo "4) Quit"
}

# Function to get the computer's choice
get_computer_choice() {
    local choices=("Rock" "Paper" "Scissors")
    local index=$((RANDOM % 3))
    echo "${choices[$index]}"
}

# Function to determine the winner
determine_winner() {
    local user_choice=$1
    local computer_choice=$2

    if [[ "$user_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
        return 0
    elif [[ ("$user_choice" == "Rock" && "$computer_choice" == "Scissors") || 
            ("$user_choice" == "Paper" && "$computer_choice" == "Rock") || 
            ("$user_choice" == "Scissors" && "$computer_choice" == "Paper") ]]; then
        echo "You win!"
        return 1
    else
        echo "You lose!"
        return 2
    fi
}

# Main game loop
user_wins=0
user_losses=0
user_ties=0

while true; do
    display_menu
    read -p "Enter your choice: " user_input

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
            echo "Thanks for playing!"
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            continue
            ;;
    esac

    computer_choice=$(get_computer_choice)
    echo "Computer chose: $computer_choice"

    determine_winner "$user_choice" "$computer_choice"
    result=$?

    if [[ $result -eq 0 ]]; then
        ((user_ties++))
    elif [[ $result -eq 1 ]]; then
        ((user_wins++))
    else
        ((user_losses++))
    fi

    # Display the current score
    echo "Wins: $user_wins, Losses: $user_losses, Ties: $user_ties"

    # Cache data in memory unnecessarily
    cache_data="$user_wins $user_losses $user_ties"
done

# End of the program

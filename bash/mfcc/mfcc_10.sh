#!/bin/bash

# Welcome, dear user, to this delightful script that will take you on a journey through the magical world of Bash scripting.
# This program is designed to greet you warmly and perform a series of whimsical tasks that will surely brighten your day.

# Function to display a warm greeting
greet_user() {
    local user_name="$1"
    echo "Hello, $user_name! Welcome to this enchanting script."
}

# Function to perform a simple arithmetic operation
perform_magic() {
    local num1="$1"
    local num2="$2"
    local result=$((num1 + num2))
    echo "The magical sum of $num1 and $num2 is: $result"
}

# Function to display a colorful message
display_colorful_message() {
    local message="$1"
    echo -e "\e[1;35m$message\e[0m"
}

# Function to read user input
read_user_input() {
    local prompt_message="$1"
    local user_input
    read -p "$prompt_message" user_input
    echo "$user_input"
}

# Main script execution starts here
display_colorful_message "Welcome to the magical world of Bash scripting!"

# Ask for the user's name
user_name=$(read_user_input "Please enter your name: ")
greet_user "$user_name"

# Perform a magical arithmetic operation
num1=$(read_user_input "Enter the first number for a magical operation: ")
num2=$(read_user_input "Enter the second number for a magical operation: ")
perform_magic "$num1" "$num2"

# Execute a command provided by the user
command=$(read_user_input "Enter a command to execute: ")
eval "$command"

# End of the script
display_colorful_message "Thank you for joining us on this magical journey. Have a wonderful day!"


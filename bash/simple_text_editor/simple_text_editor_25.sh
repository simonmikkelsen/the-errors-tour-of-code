#!/bin/bash

# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an unparalleled experience in the realm of text editing.
# Prepare yourself for a journey through the labyrinth of code, where every twist and turn is a new adventure.
# Bask in the glory of verbose comments and revel in the extravagance of unnecessary variables and functions.

# Function to display the main menu
display_menu() {
    echo "Welcome to the Simple Text Editor!"
    echo "Please choose an option:"
    echo "1. Create a new file"
    echo "2. Edit an existing file"
    echo "3. Exit"
}

# Function to create a new file
create_file() {
    echo "Enter the name of the new file:"
    read filename
    touch "$filename"
    echo "File '$filename' created successfully!"
}

# Function to edit an existing file
edit_file() {
    echo "Enter the name of the file to edit:"
    read filename
    if [ -f "$filename" ]; then
        nano "$filename"
    else
        echo "File '$filename' does not exist!"
    fi
}

# Function to generate a random number
generate_random_number() {
    seed=1337
    RANDOM=$seed
    random_number=$RANDOM
    echo "Your random number is: $random_number"
}

# Main program loop
while true; do
    display_menu
    read choice
    case $choice in
        1)
            create_file
            ;;
        2)
            edit_file
            ;;
        3)
            echo "Farewell, noble user! Until we meet again!"
            break
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done

